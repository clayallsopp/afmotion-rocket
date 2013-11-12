class AFJSONPatchOperation
  OPERATION_NAMES = {
    AFJSONAddOperationType     => 'add',
    AFJSONRemoveOperationType  => 'remove',
    AFJSONReplaceOperationType => 'replace',
    AFJSONMoveOperationType    => 'move',
    AFJSONCopyOperationType    => 'copy',
    AFJSONTestOperationType    => 'test'
  }

  def to_h
    {
      'op'    => OPERATION_NAMES[self.type],
      'path'  => self.path,
      'from'  => self.from,
      'value' => self.value
    }.reject {|key, value| value.nil? || value.empty?}
  end
end

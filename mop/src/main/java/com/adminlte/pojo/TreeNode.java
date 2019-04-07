package com.adminlte.pojo;


import java.util.List;

public class TreeNode {

    private String text;

    private List<String> tags;

    private String id;

    private String parentId;

    private Integer levelcode;

    private List<TreeNode> nodes;

    private String icon;

    public String getParentId() {

        return parentId;
    }

    public String getIcon() {

        return icon;
    }

    public void setIcon(String icon) {

        this.icon = icon;
    }

    public Integer getLevelcode() {

        return levelcode;
    }

    public void setLevelcode(Integer levelcode) {

        this.levelcode = levelcode;
    }

    public void setParentId(String parentId) {

        this.parentId = parentId;
    }

    public String getText() {

        return text;
    }

    public void setText(String text) {

        this.text = text;
    }

    public List<String> getTags() {

        return tags;
    }

    public void setTags(List<String> tags) {

        this.tags = tags;
    }

    public String getId() {

        return id;
    }

    public void setId(String id) {

        this.id = id;
    }

    public List<TreeNode> getNodes() {

        return nodes;
    }

    public void setNodes(List<TreeNode> nodes) {

        this.nodes = nodes;
    }

	@Override
	public String toString() {
		return "TreeNode [text=" + text + ", tags=" + tags + ", id=" + id + ", parentId=" + parentId + ", levelcode="
				+ levelcode + ", nodes=" + nodes + ", icon=" + icon + "]";
	}
}

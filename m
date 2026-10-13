Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2239CCEB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881031; cv=none; b=TOZhj8JYxPv3imKnS/z1gCEU173njWEMzBnyh8WGjW7ZYv8wqWpwYRyx0MiKDmy95owr35y3D7Se+kqlD/2gecF4SZ1S/j5AUuPHEYjIUu/ta/iV86eI8gH/4jWPFoIqyI4sw47MCmD6UshPhPnXwrLtWtWF3MkNrslqUq9y3XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881031; c=relaxed/simple;
	bh=xI0EXxAnxN5lZg5ZSbyRKx+xLuwEawCjGQzNrAZsmZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAn4Jq/cRPuXT342sSHkpdGndjfy/Gxww4KJ6+IufzQboPHhBgQO8CgUbBCtjMqZPUjKZUs9lmi8xUxiLtpeu3kytWhpRxabRMkulbQGuS0sr20iwqz0NJQGMtm6vzoF3vVStyGikcJTCHLcvtjB/VwCjpfbjgn97HDHea5vRYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSQQ5qDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1g+TvDB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSQQ5qDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1g+TvDB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXWI015278
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yc/i6Ly2rNsxUbSaUmJUhfLI
	QFe9Hx3IIvJnLq1sVTY=; b=KSQQ5qDeYM+REXRYZq2zWSqUMlDxWCzjIgsLjc2M
	I4GfGiuSZncKRlBLxhD9KplDvUaixT17R0KXVh5TBKJr1oDIqWFkqrpk0WSpAad5
	Kh6b9pLquS3QS2bn8T7HWhBWiIQyqlgWXB/Dof/Lk4JZk64yEcDfd1h0XC0XOXbD
	l7S3qJLiQmsoKfsyMHBdro6w48vueE6SAPmaPfF7B00eJQxeJ0iA/qxAn21PqnCv
	ImXkCe4q+bPEhRKHuJsp8hy5owvx+dAAOPR77eUeUmN0RbRPgQRcFkXAcGjUIyap
	1yWwgZQsArp5K31OnqAbG9U+Ic29LY1YqnPhG6Z7CdA28g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugabt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:43:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso907826185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881029; x=1792485829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yc/i6Ly2rNsxUbSaUmJUhfLIQFe9Hx3IIvJnLq1sVTY=;
        b=L1g+TvDBtGJMMAnlfSVOteU/J7IyxvgKSlYF4100soxKLG2ayJm1fAYQypGDJdc9Oz
         2whQuRmcaXd8/aydy3YvPJozRZUXD4inSohEeLwwh7MskZEk0Krx0wnI3kCyQ0pkgX9n
         TvaByzlndtch3jxYmFs1uljEe7lz2PcuVFJHzJtsZyWHdtcQ9l7PQePjwaucWrAykqWr
         FfZtQUUO/zB0/lL4ccKyK8OE9Vq/Y15FA2yARfqKe/jaUM6B7Tz6/OxNo27VBupLkej0
         0+bn/R0C/AXCv5BryvPY9TmJI7XCBqZCMrrVyhAPjn8TWJXwHXdDLBkmE3AlJk06smTV
         8u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881029; x=1792485829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yc/i6Ly2rNsxUbSaUmJUhfLIQFe9Hx3IIvJnLq1sVTY=;
        b=AUPUbWM7rPO736/f8N9/jsS/dixIGfZSKs2Uq7C3Cv6ThalXjowPnthzo+cXeY4FZ8
         42IAyOD3Gdg4HNbWeLN6ubGOPAjL9lKdX4DoJW3jAVaXIG0kii6fBiQW5cSILMoFtwf6
         b3I74VyPeqHYVjb6UWmDCAVtZuwY+cbMnWn6JkUWuccxqtT7Za6B1aFwUirNl74pdJdh
         vkywroku63Bp3cpMcDmDFOKC3ip6IMLWVdw+e5OwyJPO12RZsAMF/urmQ/ZQcqaZvxEE
         zVHj25nZhCqn25L4NPNNk3ZegZ8sQcctYnSJv3bTtyWjf+CUQDKOto+ITrk3B3Dc+sv2
         ubqg==
X-Forwarded-Encrypted: i=1; AKwUvBw2vY4hh9JM8n+3LDSX9mkW9urjOxR2QlSi0bzfJY++149c3DqMlM3Elz+sBKIoxICkIJoq9tFIxDt16R26@vger.kernel.org
X-Gm-Message-State: AFq9FYKbwzm2ZytOMz7ISa0jLaQ4tMkdRFqwxbuNiM4xgBtBdif0EDoL
	cnxNdpAzlUJBoJ+N/vZMtZZHH+ns/rONQFXPye5cqW6chbnDkNSaIS21/qJD732eHnhNYaQjeWR
	njVMOmIBavgDOfwPuG28FAvB8Wtuo0SCQf1uDiRwIMdA9hBH4eGHQeuwX3SetNs9iIy6U
X-Gm-Gg: AYBFou3TW8lbgbEwF+tJviHViflehSVKCGdoLV/Uh4apYzKFlx9MPt8gcrrvDkpxkem
	4hIozPBwUqb9xxrk9qntXs8HcoNdntFXcOjubbJvjbynoE8zVLrB3BH5RgTEr9GTD6Pf+8blE50
	wLRbKaaEu0qGEY+q6UrXDMVy6JztovHJNE14XeibwiKGGiNQ7Y0pPh03wJaFom6p9PIlaudOCis
	nJ16ezW5EkSOWkGt+UmFdvNpIsWok/IwnbnycItcWZcAcxMygnRqbRI4gkIKzbMzaLPWX50jX4X
	ABV5pmdZC0q/xTfdgiQRbhfWTU9drvDkgTKcofGzuU0BZP/ArIYs7IkzJCKtQQURvcC77T+3TP9
	MWgMHHnrITnnCJgY=
X-Received: by 2002:a05:620a:c86:b0:93e:c12d:4ecc with SMTP id af79cd13be357-93ec12d5528mr1199093185a.44.1791881029128;
        Tue, 13 Oct 2026 01:43:49 -0700 (PDT)
X-Received: by 2002:a05:620a:c86:b0:93e:c12d:4ecc with SMTP id af79cd13be357-93ec12d5528mr1199088785a.44.1791881028530;
        Tue, 13 Oct 2026 01:43:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de2e2ef2fsm2500383f8f.59.2026.10.13.01.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:43:47 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:43:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 07/13] phy: qcom: edp: Add Nord-specific register
 offsets
Message-ID: <hhiwnl2hb2ckzmypy4b2f7wzdmtrpdylx2j3vaoj4w6rvgvgrk@sofvxozmsfbm>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX8aaiPxb26/kR
 k5m4mgSIOwsZem3KVhBL7TpVeHDBar0a3DAMCrpngnBG7tQnKjWQKwRKgRThbl7WW8ZrSN0T6ax
 YcQ0pSidhPkvjZQ9gmDyjXH3KaLipeqoXjo3w4vjNWY0UpZv88A3Fi0K09SmqaUiMgAqm7oLpJ3
 szZLOukPLWMS8j4qODE+5OQOVlvnkWPicW7O8syyqPoqb58uv90IEOUYVwShCwTyMf4yQtoE6Pj
 saSq7KV5AI573bh9la8iS4YtS3UW/JH1rWXkEHMjiUk6MdouMSAOegLVLvnkbw7wE0jtkwsYJjE
 Pf5NO1GXMkHAHMH+xuMI7PsI414AwJ/Mlm0qYA9ZfY/5+xYhopW6EHq4uMIVS8TgdlA5TjNPAvU
 zSQWR5/c2AJUev89A0gS4E7mKCngduuMuwV5RRoBdTvn/apujGCI9ttdJZOk/S0jLA4Qf3yj6PD
 2MYFTv838gzavfCqnIw==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdef46 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ADyQKbfvbAjpQ-Ovcv4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2HFO7xA__EDcY5zXXMSN9vZMBfzN6MJL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX9LL/BmNGamWU
 zLTSHznLfuBTsHhD5gk/knmV7VU9eNlezZiNjHwTT+uUdFQjoltvyVkGPEXPvT+lIs2lg0m5YF1
 iVhHV/vU4J+WHc1FQbZlznYA8BDesNE=
X-Proofpoint-GUID: 2HFO7xA__EDcY5zXXMSN9vZMBfzN6MJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 26-10-12 19:02:17, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates several DP PHY and QSERDES v8 COM registers relative
> to existing SoCs.  Add Nord-specific defines for the relocated and
> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
> phy-qcom-edp.c so Nord sequences can reference them by name.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100036;
	b=n0z6YYqZpPR8sParvlkbmjQLco1ETTrmGp+J2sj8u7yYWLifTq7DW94iRLvN6rqewr+G
	 OnJDIy2iyqZvkvDVn5Jk9gb+ko9mZrzxOnSLZjCLoPPWyNT0yABFtgoQUGYubUPuJZVBX
	 qlMd14ADbOA4Hinnz3Rhnhz9XmVpLWXVoUEElgjNMpTqtY9tsaw8xyABWp/NRqTGwuavw
	 BW2p6YWXsP/e6C1E91xmIjxS5dYSX5YwTUR6YjcIiT6hguLxbACxN4BnRBOGMnMEx5Obn
	 TMwXHb8yjVX437gp9gRAg4dfi4dr1YQY8ZQqu8iq9oYZwOM/HDIKtpkfS9+nBbz78SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P4eIsa0QG1et6Bbl6s14T8R5VVdaEq29tvFruu1buwQ=;
	b=SynWHiJMXQHaNrGSAj5CkTvJQh8eI0+fOd3G8ZeRFUYT1zUvBaqSkhuawVjDQubGgc4J
	 885T6RBZgyg11tyzQ/e77ajSkh/By5w299xohCDovaenjsVfvQwvPnJ+mRgylMyRFDBv6
	 bpq3UuL2uFlOXSvH+C36RWVXSxF5zYS9zf+c9plKOURiukGHeQVS/bfy5Nq4TdSER7AcR
	 x7wrAyeeo586q58c93aWp9qdyFMM7OPLEzDL3kXHkA/GQQ+bR6DhCEYPTLi80mLWcFuvE
	 5RnvJvGQWn/itU6ZImunikDJpAhpMfkwh0s7HcV873RRCOIMgbrFtD5Yir56WWvwa0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mhwUCln/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ehHdQ4Lo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58C606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E58C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mhwUCln/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ehHdQ4Lo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCYO3012047
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P4eIsa0QG1et6Bbl6s14T8R5
	VVdaEq29tvFruu1buwQ=; b=mhwUCln/zl2cjPfX5urcJC7rSUoxsoSalzzQSdQl
	MjChOBwLIxUxkhsjTAakp352ND6kZ8IhqGVUCbYb09JNGZ9mtkADHTq83ms2/S7W
	89ZNxJ1eOXP+EgrFZyCjc/hyNQ2/NGNT70/YGDHoDGkBsiTtVap1Bc+XmRiMvDsv
	k54T9TLeWWAj6ff9bg8UplGe20AyPrt+bO4EjRmOq/xCFzwxamDqz0XruR+2fwlj
	sIn/FxJkdYLzaZweu/Y99g5UG9XrohOIERAAgnMPWY2VY1wjGC9Op9D+ZSmIDP/o
	XuSRUBMv6NH3+c2yaueVu8XYgJ7FYjuIXHnXzVr5VO/iTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dar70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:20:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso981452785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100034; x=1793704834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P4eIsa0QG1et6Bbl6s14T8R5VVdaEq29tvFruu1buwQ=;
        b=ehHdQ4LoLjCSwohZcQJMWZAWzOH2cyHOnvQ31heNDRMPxxCHnpC3Tru5bEEYB5s6mQ
         ZB92BaJDLRFv4WhDAWbEodE154Tz88uNy6C9+iA/lZQTD1IJ61WMxhUY/BOHzl9W5HhR
         u1crgqoxWCbBzYemazqLD9WBGCazn6oam4Wd6M6Ps5RdxpytVC7xYcUR/IZnYsdacTVM
         YU6nI93FqnlcRsWb95almKVSD9Bp8rN+hI2h29ovPCThOG4NKW59tM6mNv5JlGIi3rXR
         ZRq6b1GJ8CMzcY+/IFTqYmbuxER/QIFJWlW/SDHvS62mZZPEXmM7Tn/7KgzUDhRrIJ7N
         nGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100034; x=1793704834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4eIsa0QG1et6Bbl6s14T8R5VVdaEq29tvFruu1buwQ=;
        b=U6xTVA1fh06elqj8hRGdUUkMd3GEixxquCKMGLEGFAvHGu2rua3YxJlzDm1/E+1ISf
         fOBhRVitp/x17D3DIPCnuWHVpO01+k9oJOxvcZfltvQVkrtK5anDwwvN9cW+Ht1oXxv9
         x+tnLIImDct4D2KzpayvK+cCfP8z0YNIjs6yALNC36PLqGP6aGiPOfTkyIZJbtDZqzb0
         X0tiMO1FdyMsEg5xU01UdMGIULXUV0uNVfIpf3jZRccwnnty74m01AmGCdiWv+KmNuQH
         Ji1D8ON6kcxZsQaLVef4UZ7CfWX812vNtOz9KXGkluHfEkNNVtAhg55oXamnvkkYiKTW
         pSUQ==
X-Forwarded-Encrypted: i=1; AKwUvBywZLLu9LaIhBj9iRAwrvX43ts0+smo4QSTBbbZAGtnqkqTAqM6NeacOTbbP82Vv2eXGBTXAzZNRBfy3eMr@vger.kernel.org
X-Gm-Message-State: AFq9FYKWQxRsL3XR2uh7CcczOfT5q4+3KhKgSXz75cz4etMUZJFdWoK6
	kdGOFMw032XQ4BqdlrtD7jv6j0jqUvJJfY028qFJLlenrv6zqME0vCzXPzBCEP+lsdklkmVlQ0M
	jzPO3etc+y9HQaGPp/k9kaxTtGPJ4TX12RdrBiSv1++tto4A+WtrE/FYz+KEE/zF0Vlsv
X-Gm-Gg: AYBFou0SnCRuNU5pQEU+iZKLxhxK6PwVeZDeHZ7fbxZRx7r4t9+71WJkJBF/bLcK+w5
	6zkzgGFZzPPdTgo0Uhqi0eTA9YgxMa0ZNKvhwCMdj2jTuczapgdQ0FPdSWlOhWMUGhMG/oBdu+l
	xnEq7SGydxYc/9gSVPBKavP0YWOVlH5494tEOgAQB1e19CU45JbGkitQoitmIBHkqX6YK9WQPPB
	p+lpwTqxf2eUdNq+9n6AMnzNBVY8Qkmre2Oa8QYOaIQuRJ1FXqsZcJ/XWKSwSlSmpvT5OyUO1x3
	iOpWz320mqAY2n/vEB+ec2v8O0mdcQdUe/OY9/txdEpWpg/e1tPWcXGW2MZy+9W/fsVJv1rIJTr
	lQscxDGAOGBVqosnj
X-Received: by 2002:a05:620a:4542:b0:93e:94f2:ada9 with SMTP id af79cd13be357-940ef998f9cmr1348386385a.58.1793100033600;
        Tue, 27 Oct 2026 04:20:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93e:94f2:ada9 with SMTP id af79cd13be357-940ef998f9cmr1348381685a.58.1793100032944;
        Tue, 27 Oct 2026 04:20:32 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm23312072f8f.27.2026.10.27.04.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:20:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:20:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        val@packett.cool, wesley.cheng@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in
 DP-only mode
Message-ID: <ec5diah4trv6vcnbnxwcg7b7gyoggjrntojvses5os2rtoygsw@op7uolbonig4>
References: <20261023123512.1912-1-26rote@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023123512.1912-1-26rote@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9qQhYmljSI9E
 8rKJl6/Q38/Gg4fs+qW2gB1PilX2x0AWRw/utUBSnjuNSO+1YNvZN+x4oFVApor79IfJmfRFH6f
 G2QmXAeJcd+gT3nJPoPBii2r7O6xtwM=
X-Proofpoint-GUID: lz_m1j5ASn6-bxa7OErTL_YikrfYvGeo
X-Proofpoint-ORIG-GUID: lz_m1j5ASn6-bxa7OErTL_YikrfYvGeo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX3+VW+3qdpN0J
 oeJzDadEMpNuioBMuc4wDEkHU05dF/jeea5v05nfFzUrHrMqelrsGbr7HiNvATjEVsrJ20oKWdw
 fI87zGamcj4rZh0al4L9kKUnBySQ5NdtDE76EDNr39CkZBjpNxd3fk97xwsChTYI+/6SL2Sa4vT
 /Hz9dHjeT33G4o19EUpbMNBnZqRav/saH/5ozVNzkXZfPLbHmmKiHQ0SEz6yTCRiF2Zmb7yk+bA
 Nk4W92XSbbHtlRGOZifkWJUNG9Pj+sKmF5hw0klhEMlj0uZx7SBP7oAyL3aejeW+Yxlkj7w1+2K
 bfDgr6FpJd1uTLxbGxC0wxw+zK1WR1xdVtH/KmQ1yLJnx2NeBpu1OXgB7n4QKNLkITe04KWpcAH
 zkBNTggBtPuUMr8pS2wNGMcUia8C6OGfZqdRWtFuM2dWRFfduapWKILaPb5UiAQWUSniM2uJYMY
 59xNza5YmFxhbSv0GnQ==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08902 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=G99BCXZ-BbZkqKqEctwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-23 21:35:12, Joonhoe Kim wrote:
> In DP-only mode (DisplayPort pin assignments C and E) all four lanes
> belong to the DisplayPort PHY and the USB PCS stays powered down.
> Three paths still touch the USB PCS in this state:
> 
> - The USB controller can exit and re-init its PHY in DP-only mode, e.g.
>   across a system suspend that loses power. qmp_combo_usb_init() then
>   programs the USB serdes, lane and PCS tables over the DisplayPort
>   configuration and times out waiting for PHYSTATUS, and
>   qmp_combo_usb_exit() resets and powers down a PCS that is not in use.
> - qmp_combo_typec_switch_set() powers the USB PCS off and on when the
>   orientation changes in DP-only mode, e.g. when a DP-only sink is
>   plugged in the other way round while the mux is still in DP-only
>   mode.
> - qmp_combo_reconfigure_phy() powers the USB PCS off again when the
>   port leaves DP-only mode.
> 
> Skip the USB PCS in these paths in DP-only mode. Keep the
> qmp_combo_com_init()/qmp_combo_com_exit() reference and usb_init_count,
> so that qmp_combo_reconfigure_phy() powers the USB PCS up when the port
> leaves DP-only mode.
> 
> On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
> in pin assignment C, resume from s2idle fails with "phy initialization
> timed-out", the dwc3 resume returns -110 and the following xHCI resume
> hangs the system.
> 
> Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
> Fixes: 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary USB4 support")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

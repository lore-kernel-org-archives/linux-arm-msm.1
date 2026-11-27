Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810580;
	b=VQbD1+qVGk0vICRJnbkLwDo7tnOzkvPcdCSwrFAS9MO4Gm9nkgkmUmidJkvVjyYdlHWn
	 x3LQaolhehp/XZ1K9wNDpRpGiwFsFNG09/Ril4upzM2CW38L+lsYTGKE/OWj4KdsGtXnD
	 55UyYxxGf4tlpoyHNQNPRo36oYGhSOUsyhvIakghSwc6EeH6zQOyxbD0UAwNx2cJKflO3
	 pPhG4lDaUK8YImxAlEGaP1RUDHLUM1Vsd+zoNSsMNI+ZwlwL1nlhfbb/Ihj4uXjgvYdOI
	 6ZyV5uVzZwR72l6HK5I0A/YWaZYnL2ru3ELrgKcn4NQL+5kOTqxY9vRtI+lqxXKvmMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ogpfngdEHVCrVGXs/lkHJBfSJJ+R0ZTTBq7wN53YBBo=;
	b=JPvg6orrI3ixrhEWIMFRs42OuA8TB5VRP2RSjxBtAcO237uyrXqDmnDGnz6qdlW01xcg
	 +voJxvEwe9976Y9sxIHVk1lgQ0BHkM7jpK4L5wecmbOi/JP6ZHe3BN6v5urbRuLy7ZQoO
	 laQxIAYkMIFDIpAvm9FVKU+j5pF3OESoBy/mLybAwmLVTX2YuSK0lL7qI5rNz4EI/oVXt
	 073p+68SkuQHOM/XB+lXCIYQ1D4KLXgUOGsWRseYQ8r4Sd3Padj27Bm+6toGiGHwQD69L
	 sbvZvi8nktMTm1RXygEpJwKuFt85WosYPQtxPzPOKYYR9N7Q5Uu8Cu0yBvCW5EBjqYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hcv9gEKg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I9MaRj5F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F53606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F53606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hcv9gEKg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I9MaRj5F
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJBSlK2762783
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ogpfngdEHVCrVGXs/lkHJBfS
	JJ+R0ZTTBq7wN53YBBo=; b=hcv9gEKguNzNCT8j/mSo2BPn0A6aELN97/y3uMxf
	EERbDM8CieNBWeSmqVN3zISX4KPcPQEhzyaOLGPZA2cTywMvkWTZqhO/5dCL5aj3
	2jYJi4R21B5KbsxGHLK99exphoQr/pLYILVA4xqymhJ+R8e/BvbRZn50jGQnS9Am
	BSI//EJtC4tEKvFIbtgVDLhe7ByflCPOlLI4AZvRTQhUu/IvURR8I1pRtXwLXWDn
	cPdDheXkkwf/4mcvHhmQD7iUHCJ61yTFdVm/FhLfYK/EddY/pRAZU9VLDZ+OnQ8K
	Wt4wQNAexz0CUXlSao/92LIzE6dOnBzTG739c6BmYnMTWA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756kapjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:16:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece45cb25bso2130477e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810579; x=1796415379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogpfngdEHVCrVGXs/lkHJBfSJJ+R0ZTTBq7wN53YBBo=;
        b=I9MaRj5F8J7W9HV3NfDecoEp/VnbySteDqeK749JVT8gGUcZu4LOQ+tbkQFDCSHjrf
         m77SK1jHCvmG0RqdyxBauB/5uBc92BhzUo2DPXzhLc8F2j1U/NGHVqKAFoo+4o4Rts5g
         cuaBYz6y63iIKMYYYkxzZXRAbWGKqXCMTKXJxOwoPR1jsM1pcw0bXRRYsBHb4lY7/TKy
         Lp5VHZEgVEHmTdCsge8w7TDCicfX6pzGBD0O1Lu1D5nHSF5XCHtNhjPqvzvBQ2wSwcTR
         QQk9uD/dBuQD+LTlOM1brXuuy5z12IyMa7Gjaj0CsE7wrBaq4xdBnM3eTnVXYWaDCBUd
         yYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810579; x=1796415379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogpfngdEHVCrVGXs/lkHJBfSJJ+R0ZTTBq7wN53YBBo=;
        b=RU+jRssV/c9CwxNRgF4kb36avTgf0EDw+fzLM6PqxOjHFf3BWTW3Ujj7JgzjQPbmdE
         Tt9pQHK7hchTW+zQ/IbMiBcrxGBQVPbbsv9XAg2DH9tejYnMiPbsLctTctJ8AKABrBWu
         8PzHnE9n+VVqnamThgXahcF0ik6bQWoOuUIwI6vM1i3LCOuKfWi2GBHbYNTf3Tn85yQD
         9jqqqPXUl9k6WmQ0f+8vzA//ILA8uFUOx2LBhx5fVkYw842hOz3QdRI8v6VfmlfFiCKT
         IJ/rUegnRo0txCGH0ol/4T6eq4355ifp9EljNrHCkEpg59xxgeSfjE30DO3DQE4AXLEB
         3fng==
X-Forwarded-Encrypted: i=1; AL+hErHA1HxRogtgLFchusN3CRHALOlZsEh2WPH+ZRI33NxykVZfuteWcnO4DHooLPpd7RMXHDYHLq/x5xwuPvDJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8wWjWCJhPU94I+A6xVVRhlaaeDXIND4glGKvJuj7xGLQ1g+7lY
	mfqGImBWH0VOd2vNSp26npNXuaDLZEA02gnOnb0EQLvzxrzV9vti+VXzpIBuRyIYMQQfb0NQfPm
	qB7BTowPR/Fwe+FMYGqaNHrWbUx89747AfKj8/8awHVgcwMjjsmw7B9R77sDWvT3AFpMV
X-Gm-Gg: AZFdTZdBCh0azSAp7xxHsm2klCCWMehP61W93CCcETf7pj9pMXdvZTp9KsflPfb4wwB
	SNty4LD7oCeuLjPdwgYa1KsgB0b5WvEkp3yXG1VXTd2Z5xVDgkX+RJKPowaky65EAAQVhh9urSu
	yXt9QA7GyJQEZtxLjF4wr9kGvNrlRh2XmsnNssxdHAyIST7T/d5m8kXMHavoyhdi2RUgrAS52eV
	FPwvoNxt0nO8364pV4FxaUZdb5PiOvi0sILL9Yi0XrO5wjVSVnV8HY9yeasfgxNIhRCOFvkVxVS
	d/jXquHJbWeDZaNRuIsYYKVfCfZlq4tWFi3JnVUQI31shLcR1Or8iQR3Bevh14Bym6qrrOcsxQp
	HXwiPvG2QZ2t1BC44IM8yMr5MR3YWIktA/XU/KpMVdlZYu+IkSZDKpPR/zrxNk/ncK0cDoAIiuy
	O+BrxlfUI7aEX00j+pwDc5UMrcBpFPkBuNe2kZxNaWQ4wzY83Frlk9rIhL6QhvKw==
X-Received: by 2002:a05:6122:1784:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ee8adf34f8mr15650895e0c.2.1795810574746;
        Fri, 27 Nov 2026 12:16:14 -0800 (PST)
X-Received: by 2002:a05:6122:1784:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ee8adf34f8mr15650058e0c.2.1795810571119;
        Fri, 27 Nov 2026 12:16:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043387sm6206566e87.49.2026.11.27.12.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:16:09 -0800 (PST)
Date: Fri, 27 Nov 2026 22:16:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zhendong Liu <yzddmr6@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miaoqian Lin <linmq006@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dsi: Fix double put of the PHY device on
 probe deferral
Message-ID: <fetperibduweqak5gdpdahzqb74zs5f4e64l2qc5h5cwolqjkf@4mteepcow6g3>
References: <20261127-upstream2-msm-dsi-phy-ref-v2-1-be82aab71166@gmail.com>
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
In-Reply-To: <20261127-upstream2-msm-dsi-phy-ref-v2-1-be82aab71166@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX37fJTzmnkmBz
 nopZl8OzLvCbPJqocWp8zCTTbExJUYRZ5WtqT7R0iOJo3wA4xTz0XyBvnpQpFXHtEv5CByF2KH6
 s2jRM08T3wvjAST5Q1os8idjlywp11tz1zb4RcRzUvfdZxb/wHgaMbZNzye7krnoFL+cLf8vJVT
 B0/LMjnHQ+Tj7ZDuqNXEmF/2d6ajRgTmDONn0nj37z8c2m6oa7NB6NAYTgClDQVMtE5ZurIznLo
 1J02U95tFRx1jLrw4n3nV7fLZK/Vki/7fUQSHGr5L9HshoH8wrzyalqHSelIbVCSrNEGtW8XkOD
 TEenPl8+CCQAAFjrtL3w6XFzuTjP7gSN6bgZrkU3TsNBN9AG0Vgu9X9mlUZKcaa2xUcPgRw4Mi8
 XOcfsdTyp2ITctQGKiJIXeyCgIjpyRG77OyKYn0H9vMSEXcSv+0hbrPWSdY8AoZtKPajKb609P6
 NjfgFzUuTMwuDUovD8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfXywWo1rbqvVbN
 nmvugnKI/bTEjmgh+uhz8Q29AI/IBg6yTTiuwW2VGFZx3EZ8HrR2HBte1yHXW96GhYsQ84+98Kz
 vxSHsmdYyfA8PiRSgGMIUoNMmuW5GL4=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09e513 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=oPjNpEVOrg6OkQjzHwMA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: KlnvbImITDl6iHQU2N_j03OMpy_i7E42
X-Proofpoint-ORIG-GUID: KlnvbImITDl6iHQU2N_j03OMpy_i7E42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

On Fri, Nov 27, 2026 at 11:24:37PM +0800, Zhendong Liu wrote:
> Since commit 6977cc89c875 ("drm/msm/dsi: Fix some reference counted
> resource leaks"), dsi_get_phy() stores the PHY device it looked up in
> msm_dsi->phy_dev before it checks whether the PHY driver has bound, and
> dsi_destroy() drops that reference. dsi_init() calls dsi_destroy() when
> dsi_get_phy() fails.
> 
> Commit c04c3148ca12 ("drm/msm/dsi: Fix missing put_device() call in
> dsi_get_phy") then added a put_device() for the case where the PHY
> device exists but has no driver data yet. In that case the reference is
> now dropped twice, once in dsi_get_phy() and again in dsi_destroy(), so
> each probe deferral for this reason takes one reference too many from
> the PHY platform device. Enough deferrals underflow its refcount and
> free it while it is still registered.
> 
> fw_devlink normally keeps the DSI host from probing before its PHY has
> bound. The path is reached with fw_devlink=permissive or off, and after
> the deferred probe timeout when no driver matches the PHY device, as
> the device link is relaxed then and every probe retry of the DSI host
> drops another reference.
> 
> Drop the put_device() and leave the reference to dsi_destroy(). This
> effectively reverts that commit and brings back the single check that
> it split in two.
> 
> The double put was found with the help of an AI coding assistant during
> a review of the driver.
> 
> Fixes: c04c3148ca12 ("drm/msm/dsi: Fix missing put_device() call in dsi_get_phy")
> Signed-off-by: Zhendong Liu <yzddmr6@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

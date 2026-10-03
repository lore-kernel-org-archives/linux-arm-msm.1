Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC553019C8
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988444; cv=none; b=FF7qmmBKwBAL0+sjQxLb9Oe1uB3v3lt27V5VlSc4TZSCtwMx4c9fUBTeanbAWjTb9zkiF6s0BxLH4EjZu0h2Vg/7Saui4ASYF4rSIS8fvX9dUDOpuBWBTB1Ep8mO0G4PhVg6ibj703QZueis7Wgtdj2OGZna7i/j7S/LWSlI2lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988444; c=relaxed/simple;
	bh=C26BeGFu/zSKb6Hmjy5a7QFJNXyiI8Hp3QSh5M2tmN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZyNo9weLyxYYaqlHKn+X1ET9ZPfKPsY0Q1D5w4PHvkpxNby4w2/PPkL0zwGyaZMsg0WIZ6FVosZVNEA9I2AtJZhcPYlpBZiL7wzptXPR1VaivFik28hjGf5Bboy9qWxPndwttGyIPBjK0BX1MG5VUDOgy40Fu6LZvskOuRt7Dhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr1roGXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGUa2GvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr1roGXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGUa2GvD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeJwb2309717
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ylCuDOkn6CBYsIUnQC9b4yfcmzAwShqIqn5wRMueEQ=; b=Hr1roGXGGuK/2Ys3
	PgGl76KQG1zOxNLlVCnQ2ynxWrck/9kbFwDuLrXbMEb2JZ3P+GkDVCVtD6GPC9NV
	vRDCRvrluqIPbORvCQxCvHC9ZIONz2Oqfer6oJkeA1wqpf6y0jhSoqCNv0v8VyOh
	T2nkJSA2gffkn2OOJgRLO+bWvv+mFCZ0A7f0AuuIXi0hEisowMdToreBElclx/mC
	sm2+HM55xwM4X5FpHniNXskbax88saef40RNKwGDLuCb66h7ISmvIh2ZGyjLkAcJ
	wiOf3SqvhKfw2zihY3tHz0NLdY4OsuFdKaEx4vmYm3hiHvk17GiJRffhwbapdLEE
	WdorOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3da3sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:47:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so12767785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988431; x=1791593231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ylCuDOkn6CBYsIUnQC9b4yfcmzAwShqIqn5wRMueEQ=;
        b=LGUa2GvD72FKvgsKvqchBf0wsO1+3gElYK/o2NhtcSyo0eKd8D42y/6xmSvVJTfDH4
         XTNZj2PaU3EbdBPcZopHsvPAJ7SQ54hY4n+tFxEbdjmo2pF38m39QEu5UpRF06Ix+sSR
         XmWI6s//SCU72w+V8aN+mn6H90KieRMggBve62G3VDJX5l+gKYlWKoCAX776aKZxZF1C
         CF5yIJw0Y1lEIYYbXCXgWNarIY2A2u/Plb0FDTwk9MIhFsKNkOA5EkeY0qdnDNjjvxF5
         ekWOE+tXYrgRS/bN12fEDTeL2FeT+7cnAZ3+NfTMQYvxHfVCdTowpKnYoZVnJKKT/zTF
         skKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988431; x=1791593231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ylCuDOkn6CBYsIUnQC9b4yfcmzAwShqIqn5wRMueEQ=;
        b=g+s0t5AB8h1EvpkduofP42Uy/6DrfA8tgRTrIdVmUTC+iKxv43tdXNkZI7GYG/oqYI
         QCq1xnVd5wk6ygbTtfXehrPAD5Fr/sAx+vmhZi4a7Rjbs37OXFcGwr0Hc6pTifw/ZzSU
         215Uz8yxBMaVkg/YJdXDubm43ciFOFEyDeOTBXWI7jwTEo3FLZr8aZ7XWuXR8SsyegbZ
         bIfvd2ucT5G6+6lfY5f6oJv4tmIiYY+JGNddJf7b8HgKo50Aj0HJCRI/mvJqSZ2L+H2L
         737HvaTut0piotEbXq2O0Zb3yWQkP01u8zSO3jNlruUHBJYOLAGON1I4gNbnuoa0q4DX
         lLDw==
X-Gm-Message-State: AFuF++la74S3yackJYg24gKQti39lPaJJJhyyyjNiN8ukiEvi/zOGupb
	ikq2ToEABIFu/JrXmvHdi9mJbLxgyPu8sS39EdpFAA3mYjwjPLHTKjx33ySQXfZl0jF1SoY83mx
	R0HwHTaaqLKnJzcvA3I8BOQw2oThtNl/1ZL37rXGVi3QYoYGtukWIkMYxupTldfeFJjOk
X-Gm-Gg: AYBFou1/3Zy2w0xblELum5QuHFx2h4EK9K4N7/gByUepMftHSVV1MHmqc1tRa7vhZXQ
	D/4eiTH203RmFPEJwdWIKWQCJ0TsVXspmXZqg61MGHVt72B0oURZBaQiCBQ/cGyNUPvLFxu+kna
	5sjDcJg83/CeRVXTvnBVYk5l4QvAYZDBJfl4XTxqKKKUEYZkVmGh2FX0s3ciNKST0XNm/oAt29Z
	+lqF3UAmA3y4GrWatvITwTNwZmbgASzHOBxbKFViHE0RmFbGOIx7YSLSlRbt4c4HWFXNB78+u6U
	1e+yPI5M2LwF1asxfT6P9dg/ZOJ+8do7hShnXPIbmWv7Y9LSQ02VellIqXb85BX5COkvKgBjuVs
	+IUeRL9lN3sQPdJzG98ntnIu7+VPPJgjonRMkYgceH6VdpEbRFgLOJh9zqIs8P1nFUdpRGBcSDc
	kKYPVXXG7gLCO/
X-Received: by 2002:a05:620a:8804:b0:93c:612e:9b51 with SMTP id af79cd13be357-93cf18a7807mr872505485a.55.1790988430625;
        Fri, 02 Oct 2026 17:47:10 -0700 (PDT)
X-Received: by 2002:a05:620a:8804:b0:93c:612e:9b51 with SMTP id af79cd13be357-93cf18a7807mr872501985a.55.1790988430151;
        Fri, 02 Oct 2026 17:47:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:47:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH v7 00/35] drm/msm/dp: Add MST support for MSM chipsets
Date: Sat,  3 Oct 2026 03:46:56 +0300
Message-ID: <179098834065.3641559.5174851000778073981.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l4xBuScWkPSTR0EIqiEie78HdqAH4TmT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXw8iWRR+x0mdW
 GxHXx6MBhy6wojF7DOehO6oCsFmjc+vV1HSatJ0duTpTVWb1qXDAHVcOOZxcvpZ5PdkF+TWzHrt
 Zq1biBDhaH8rAY2LjKiinwZquBcH7oI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX66ZGbFQjn14z
 WfS5lF1KVtAGqnTRwu5Hw0sYcDUE4NoPGnH+WxyuNuYoVCy/Hcw9ouOc6GKSwwCWWIukx4oOE1o
 x1lnY5dyrPFkLAUmxK59f44MWz6UCkBMY2vJumNDeiGdWghO3KAzsvLUsw2TNkog/oMvxmPKK5G
 GOVJH2Xjyw4rRE+l2XSsqhJtDzChI8XUwH0KNs27YuX99keHmJv+qFk8mNZPlzv8Z18Ddx9Z13Q
 niseldWZq2TVJNM7HxLVjit052cbC9c4S7XXzYWwWz4ltcbHEH8+rzFJE/MfChjvv0TK36/16xd
 gneJGskgC7rayUEQmI5pAXKQKN2GOnJZJ+HBCRAYlJ90QWZZquA0wqpbAiCXhcju/v5XJYRx/Uy
 CXdjSXCNB6NsINF2Ncf5+ZxqXGhIoyPUW3ui1SXoDm1EZnXMDfdkKV0Sw6/UE2eqIM4zut9ne5Q
 LOCnIo4ucEH/AlI78vQ==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac0508f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=NtFGmenAaefONujONKUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: l4xBuScWkPSTR0EIqiEie78HdqAH4TmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Tue, 29 Sep 2026 12:25:24 +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams.
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> [...]

Applied to ttt, thanks!

[01/35] drm/msm/dp: move link-level teardown from display_disable to display_unprepare
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1bda647ce61b
[02/35] drm/msm/dp: Pass panel to msm_dp_ctrl_config_msa()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/642a8c954d4c
[03/35] drm/msm/dp: drop redundant config_ctrl_link() from msm_dp_ctrl_on_stream()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9582ac3ad673
[04/35] drm/msm/dp: introduce stream_id for each DP panel
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac12c30bc556
[05/35] drm/msm/dp: add support for programming p1/p2/p3 register blocks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/90bc95ebb04d
[06/35] drm/msm/dp: add MST stream register definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cb821ad0df17
[07/35] drm/msm/dp: add stream-aware link register accessors
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5e4a3f7b2620

Best regards,
-- 
With best wishes
Dmitry



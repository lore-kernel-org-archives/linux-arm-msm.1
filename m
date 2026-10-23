Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738645;
	b=2tjuy1GT560UXZu1/2tCYit1iD6PfthZ0/UHF84DHJSgoOgTSo+xnfvK0XLNLeQzsbER
	 YEiESVDC8aq7pnDEDVGuKGkkXwrd83N/uSr6vbqXuUxtPqd3y08H5P5gxpn1x/ZVHgB/6
	 XjoItyQr6fzt+t2p1ujqgEVg06/7CsCrrDUb8a3NspRDxFXdUaFdA5yntosicPP8+Hzs1
	 yts1C4F28OWZbNSP5eFQaeT1UVah60la0IhKFQSLFWDuOtlvxPwC4Wvs0UWqWdPpQs6tn
	 iyTbGyJ7FNsAbVY+MevRe5mm9IrZrq2Xbm3i2uz8yvXYxUGwYgrjsbD7Af//m6sX8eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
	b=BMIn3no3Yc68vJM92dFD0P67VNtvES1D+ZQ7GqNPj4hDF95col558TvKe8WTkIcNeqKR
	 ISqoRxoht97cTmX001f1APmUZpa0kIl85JGI75qP4jBGpyepKGzlC5JDXIE6uMNPwKdgb
	 1ZpyHvq3rEgBl1b8ms5scqe+zie8doLYILfXJkiXCKNgStbHy57CmzXcW0oHU2jaMnUg7
	 qpDdF5USJs1GMPMnpkE/CN0RrgaHaoMv2yzO5N7jWasC362XVa7ohC8dsqufghZUxxEun
	 Go1N4rkgtoVOjLZCnyDbkPPAeXyMXkF+xU4xNSKf/7CKQ8rWXFQXkDHinZi9znMN8BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFfEZkKz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QgkzFYYh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8049606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8049606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFfEZkKz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QgkzFYYh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Fj3q4008194
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DcoXlWRKjuA3ss6Tbgxr6QeV
	j4UArC2GCkRmhAMcuic=; b=cFfEZkKzP1uu2iyYQz7OI9qk4OXKzTsnaPoHyKaD
	JP1XeIGyQlTOtvR+y9SP+eL1MRCnTFUcTi9/gFVo0/mnlIhCuRHmC0aNod/Tk3LF
	YpvsVF3lD5MZUKL7pNMmlyAv0j5Dle3n1PyKGSsJ7BjcjcWoaII/dQuFJC9sO0tD
	GbAyeJdvrpHVMK/slqbhA5ng0ope0skxgIHXH9hpogKheQLEw1C8QWi5N4sofmV+
	BC5CahCfZs304bu9gFujPQ9176ooSoC7dC2CzycMLoYe4GYbnA9/t+ppfg2zkf60
	FNqSzJockmnr7VyZkdy8gAby+MBs/pwyGkI9RYL+6Z0fQg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmasu95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:57:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac6971ab44so156334a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 23:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738643; x=1793343443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
        b=QgkzFYYhwUKV9b3HK59LHPnqqSaqEOzQ+Za2Ptea5nVHdp24b1JThnSv8PgxAh36en
         Kwa+rdlQNsRCYRl9oMPaQmJ1KFnQFYaSXCO13ZZbRTTCJ0vP6E0flWsNj4HLpAe5NRW3
         1OX7SrlhQChuHXPfvWj0UksZun7dleP4D+LEAF9PE8N6gOqo6acuTUEUKpNBiMawNVQ/
         MGqVVs/8mk2WAr233b10JQSBvAHYiouZVmFbnbzcGeRI33YaynK+zuK7T4NNpCyKI0lG
         YLd4R9UX1JeNnMaTX4xu4bGr2UiSpx/51aWFGjWcWGSJj9ps9zgnOjGty5kjn4ZDNVJ6
         m4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738643; x=1793343443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
        b=wlzpADqIvQxet8KbHxF60dpLOzsD26Zt5+kSFGyvZc6c5SftdDlfUctTEkXBj8+F4L
         3j19lHg+nhL1oHrwG+ffSZGLjp8aYW9vjWTMMbXV4bkumiJjZdOxSkJ4DRZ7S/vf7eam
         eBVPkhDqkI0GjDBUIhJf/hqQdhbxdnsIRoHJVwx2WVXChck2/Rp2R0N/CbVTKX+Sokbz
         jv9VkJMf26orfZ+2rQD84DJ+jKnvne1UNv8pVak7BtvnkqBIHhWRA6dBD8/CKTMDEj5D
         e6rw+8csnYFdiaFclU/IJjA12oR7QxBwsGuLqWwTu+wuFARMtZem1it/QdRQVXaiWyQo
         ifiA==
X-Forwarded-Encrypted: i=1; AKwUvBwH9xexYOLolCtPg04nAWCtkcfZqNiGj1DjW5+xsxNRzm++wLaOvSMxuXheHb+D/bC2dIrcfOFLREWTcguE@vger.kernel.org
X-Gm-Message-State: AFq9FYL7LYz4QdlLiHbrw5+E0BLyGseEhqbk+PxPam2MNs046Ott25wg
	35osukeS7dLiIJqVIF84mRaurLUSu86N0rF1BGTajBZZADafGqMQrdse1GBYXg4WXXLGNyXj8vb
	UO10n4iehkTb2KbhkT9qEnh+TxnE7vbnx/S5/VGzxbknqqkIcJCQUJGMSEQXyPPhTBIUW
X-Gm-Gg: AYBFou0UW1ltbBDUAa/AypFVj+2ptam4C+/R5FaVUksHGuTxwtPLjI7jDDE008vSM4K
	H+i057Wm9crpxJ3Mo177Y0kOiRIFehnj3S5xKF8zLWX0RILysECJ4RAX+LosqCQ5FV1RyrliVLP
	9n3Nchkfke3QEZM8qrIvFSts8SMDMJ+FENBLp52VsvBi+IUvUp+x+d9bjwcHV6B6n2JUiLjTXch
	6M4S4p04wlntq2PqCyB4bM4iCpvVkYU3HWq6BwhPt/FQAV/Iqhduq6TxUJqFvmasEzZ58sOlc5x
	dXVeSzE4LG12ud4CnOoxx6GGu+TmtZjN4TKW36XSvS5gBFYH9wEdu5TkPFfZRl+C7Xev+5XUEQJ
	ml/bJexJX0q10FMZhWtV5u9Hqno5QyLV5a0oWOrZba+WWbzHlvRJFMgtA9QsNE3bzbmU/tAFcKI
	alqS325BIA+t4uHpFWCNCuBF0paz2wdk1Jbmnw1QEWvYsxZHSp7r4=
X-Received: by 2002:a17:90b:3912:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adce7250b1mr1847180a91.4.1792738643175;
        Thu, 22 Oct 2026 23:57:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adce7250b1mr1847153a91.4.1792738642568;
        Thu, 22 Oct 2026 23:57:22 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2994cd2sm650567a91.3.2026.10.22.23.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:57:22 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:27:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 6/7] arm64: defconfig: Enable Waveshare DSI panel and
 touch GPIO drivers
Message-ID: <atsFS4y9cnfKL2uk@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-6-adaea735999f@oss.qualcomm.com>
 <0d4d6a18-ad86-479d-a030-5eed8f5460fc@kernel.org>
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
In-Reply-To: <0d4d6a18-ad86-479d-a030-5eed8f5460fc@kernel.org>
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb0553 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=phjb7eYm-OhZhg8tdxIA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8YjwFkG6dMOp
 njqSaHnmZYCEzAsenadtSWptdfxZe3llf6+/ZwzmwCVDjvVwa95JIopT3c80W8PF9s5SqZYhLPt
 xv/yCcwdgJK+hwHY0i6g7jI5Fvtdw94=
X-Proofpoint-GUID: nI6mTGzWDpvwP2E3XfCllwiY4FpKvFkJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX5TnqHqnpfS7C
 YljKLjMT0ACl2sZ3YeVRvFxTugBJYnx49FGb7yC3VZE4so+hzIU4E+tIqvpm+M2zj97r88zwVNU
 ct1nKAkJLtIXptHDIkOAy0BkUuLN/Yd9HjjiWMCfG+HTuu98PJYLNRHMWNV21k8H7VVYuNnwwZ7
 J83YbbiweCE09fsuMONgr9aVGsIwxCkZM9pqBM5aW6e5AwFpTASJhsYqQqyySAcgM6YYCjiYsV0
 pUP9gvS6Fuo2kzLyjWqLn2WIlEajL02UBc3iAb5nKAIqoWl1LH7p5fg1MHfUgHfrCaSzh9lj+Za
 KIApwHloF7GDg4rQDtEesYX1dJKRt6ynpD5K+5YJU2rxbaulZone7HsTUBAkcPuGCt/ZfpNEQWg
 trQraMeFUttlIwhdScNuWv2AfNK8CeUUY8xFvBKiGO7Mc6lS8e8khJgzD3Ds3VP5cwEXZo+iWcN
 HgiZ4AOZeGQyiUZkZlw==
X-Proofpoint-ORIG-GUID: nI6mTGzWDpvwP2E3XfCllwiY4FpKvFkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

On Thu, Oct 22, 2026 at 12:45:04PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 16:21, Vishnu Saini wrote:
> > Enable the Waveshare DSI touch GPIO/backlight controller driver and the
> > Jadard JD9365DA-H3 DSI panel driver, as modules, for the Waveshare 8
> > inch DSI panel on the 22-pin JDISP1 DSI0 connector on the Qualcomm Shikra
> > EVK, Talos Lyra EVK boards.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> That's not a separate commit from other defconfig change.
These defconfigs are required for Waveshare panel, defconfigs in other commit are for RPI panel.
 
> Best regards,
> Krzysztof

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808716;
	b=yGU7866W1ckDKdPeoVXrmxtYsZZAkA5qDJC7BFoa0oGZSjm3bgDeNxH60lwSuqx3pARW
	 SewFk/ncNcXU2KLap5UDXoigq2S7+M07+FSlVVLVNy2JuNWkCqI50b+MbPweBiGJRsDYo
	 0SWGjyPfxxWhDdmVsJJUX5ZsTwLs1JZXDmw+cE1j+sRSwYSGb8vDH0dUP54LTRliWEpvK
	 QfvXTxONyZDPnM1151KndM0lKGzpDY4tj/QNMiMgYSeFfhLBXBREyjRTtlBqRYFD6QzPg
	 MXU59fhR9Kg0Ib8vHCTjmPW6p/40FDF42OOpRg7eWi4YIoE65O5/jFpmDmc90e8B2Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ej/asanrzTQymdauv6gPhKq43WrK2pfQTUU20di4pRM=;
	b=a5eaHTYiJpYBRofudfjs0aps9A82GAy5qd4iFG+SL0VfLh+883kXkmVdvG9a5dRrRBI7
	 S2fBQqq0wxB2PTNc9SqJZ9QWWsK37TWP/NdW/2p/1rZGJmjM9GCNPNLryV5swKcY0HaVP
	 L6lcaj526actpmSpRYSwRmCMcOQEOsLy/xEUnknrfvn4PVX6vn7ahFnPhKUWxSs5FRbNo
	 wOBOIXeXFx9DG7CG9VsqhAA2prmENuhVbgmOZw2Y1h/0zZc6+2N6U18m7Q8snaUfKDI0Q
	 UL3kxfJLSDkGF7E641llDXTlv7u4R529luKi0mXiTxYt45gurmuNYmKGmrv8T+zFuMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=an9z6BYR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmzj8BHI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B067D606A33E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B067D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=an9z6BYR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmzj8BHI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJR81F2668637
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ej/asanrzTQymdauv6gPhKq43WrK2pfQTUU20di4pRM=; b=an9z6BYRjZ62lPhu
	rQPhRkFMTAKj2XZS5bZrXG3n7qcqXRdEzfC5uHMmXLA1IxU+MCz+QKeTwUNrVxz6
	HfgqTn5waD/yBZZ74nypJWDkLUrr46aoKIAjyscI8SELD2Mk36gww8inqUY7a4H+
	2rKgjJOvzxmaAX0iYzN3IfTLAXHI1zI/b3F1YojMymNjdVAjpYj+iR2dIeKWZLnU
	NNQ5dmNhf5lPly/kvHkvm8urhDl0NXN8XSQ8ow8+UIvDjtY5wZXYiuP8b8078Ih3
	psyzDF8OiAX0xz/Tqzl9ZvNvLMhUgV/TC/3lpBsG5U+5YE30YgdgXMzaZXOXr2vK
	N46BNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1jg1ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94967c6d4f4so943430585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808714; x=1796413514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ej/asanrzTQymdauv6gPhKq43WrK2pfQTUU20di4pRM=;
        b=Mmzj8BHIDxlag7IwKAa/A9SMx7rP4ZIFV8Me3D95/492fyjZ0129TVJFO/AbVeuRnr
         fhEXTOayKhuIx9DHOiDp7QGDpZta8mw4j+t2fA+9iUTnIGs1kEaL3IRLc7ar5owgv1Tf
         3SgY+mNJMFlwM8bgmPKK0Ga/MThjud3zZD4aF8lUAPloL3IVAsMb3yWdxiU0P8gapU62
         NDmPDiGjbDY5H4TCIH1Kc0orkRhXWS50WCCJnUja8OSAWqAq3IQHXgx20MtdiRiwQ8zQ
         P7HctM8EnC7z6MWcXzBXE2JoWsWzEeTMV6jsr9/UVT4TSA6vf0vwEdVTfiPpXHXxUJep
         gAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808714; x=1796413514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ej/asanrzTQymdauv6gPhKq43WrK2pfQTUU20di4pRM=;
        b=Sopwu3w3gVc4WLOpfXgKczv5cCtsiml+x7EzQ89650XwvZQMS/HXT66HKx+SE3BgoG
         G6p+Nl7DqpXwNDkZlg2ypFXnu/1ptOKu/n9UXOeiBYP0ZXxSsESzPWjqo8gtWdh7izh2
         oUFONYdFlViv8fCUQItxozJ/PvgKKSdLlmkwa4TDXigKBVIuuh9JQUwkdNBOOlxi4uw7
         4jaXus1pvTAw+ho0Zmw68iu8Gc/yCzbteoL+/aDhVdOLiWGMFGZy6cIUhz1jxRFTxgT5
         +ddKEMjm9vsuzgPpAkAv6RjFW31oaCHYDoiSChW7aemBkSFphgKTof0iV1XL86xCNQRf
         FtCw==
X-Gm-Message-State: APuU4Z/A3QRmFJ1/fP0z67+kCeq1UxrPLk3IXqp0xzzYE1fCOarW5fEU
	umxE6AE3wBjnHg1jPU/C3g9hlmReQVeOKNiVN24nno+aiVA/el2AYvVi/kzISi59pF/PEcmC68E
	EMedur2cMrsr4SW4Xq/FGh1bZaDOqju5EudpiJ7tnmm0bm8aIJq85TO1Zv2bEtHZq/kuV
X-Gm-Gg: AZFdTZeYYsW1T2a8lRue0CgfQqx+g7Bc8ACOZ0tAO+p6VjgESu3O0lzpu7FpAY3vzq3
	ozaA8hbK3NfZx7UYuyere5DykIeCRV2zSnbdTesIQfkHj9BrPoEZC1owJFOXUef/SWz4wOvIPU5
	ABgE/LCFfsIljd30IVDPCwkCojMct0u0t05IfCYC0C01mcXaDurZ3a46jZzvp3YPT3Hdo0D+w0M
	Ey/yVG1jS9T5dRHGtarxfZAbSwx/V3xjJIE3V1g4cdCvQWX0NQkymH4BCL+vOJ3iDD3m3bZYr1n
	52uwprYqID34BsX/R9JLnY/gEYte+TlJIvU5a2JbUVDHESDTJwm3X7S54hKiZ7pzvW3+aDIMwjE
	nQL+SYnMttu+LRPz8FmmPFu8jUKe5Im9f2EpwrARG6YaaucRI45NYwIFoSyQAIDXCD4NCkCo7tl
	r++c/CoaFpKM6wSa7SyJydneDgfjiU4j68CFZUUjF9D9exQEXBGna+wiFg377HTQ==
X-Received: by 2002:a05:620a:45a3:b0:93e:e2ec:3bf with SMTP id af79cd13be357-949bac7e22fmr4446256885a.78.1795808714108;
        Fri, 27 Nov 2026 11:45:14 -0800 (PST)
X-Received: by 2002:a05:620a:45a3:b0:93e:e2ec:3bf with SMTP id af79cd13be357-949bac7e22fmr4446241785a.78.1795808713225;
        Fri, 27 Nov 2026 11:45:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:26 +0200
Subject: [PATCH v4 13/14] drm/msm/mdp4: disable the vdd regulator on
 teardown
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-msm-kms-destroy-fixes-v4-13-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Fjoc/t6O2FzPpmOj/BljVug/2AxVJMQttbKWnOBTdw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2tjbX8Fo40ddVA5EuLKAan7dqUWWEhva7Hq
 wtVDKaJDIqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndrQAKCRCLPIo+Aiko
 1QquCACkKYIik/izUwYWwnOcNmg/atdqLAXQRCRRoVIqIxLW89M2kZanMn09Z8pNYilxdOYbMp2
 F88yQLKO0oG/TsFZuEUpm/szBdxap2opBV8O930VsJ/Qbgeds+/5BYgFGZOyErrPihZ1U8tz7hH
 JRc4D/6SetoxrtK4m0Px4g42CoJqLTaksjpQERtbupcgxyr//5ngj/zurQkTQ7Xat8JYsmxafQ0
 rbOa5QvN/JjfOjDMM7U6WcfGnNTAi8aeC5z58lXJc30dE8Tr8Jt7YJb2CnXC910/BMspO5qQqCy
 fGYJbnaQQFP5MqgjHNb3wKC1FCx9S964o2Ogk57tSSloyQjo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX3mK3ihIigJK/
 xzzD4ZHhjgvHC3FLXWrHPKnTS0kihSwDjf9adT06YmI8rTXDVbcFZMQRGSqVC+Fpsbax/hIrAVI
 Y0BZ8sR9//IOG4wSUl9aGBQImVNOxXguuIe5fKqfqoWSY0Nqz1sauTbt3zF0cxnbzKSneHLiB7r
 q3Pyi4MaNTMkAngpLMsHt9UDjtBSqeH+zdYZ0wJcGYQVBMfx7TvOWP/DHLsmdgNy23CmdCV6rms
 1fU0bslUXufgjxcZ9thd6+kPdaNyZi2Skwkez+aR9UMJF2NZZypi/pX7Rn89YNC4Jkf+XAA4mQV
 DUpNIn465B/hLArzvBtHff4o/OMeW9C7VAlBE3N731oD154LA8iBB5VJuHic1AYPmOhISJ57UOK
 Vw4TF0nbm6O63L8zWR4PpLCPizfIK6eQikQVP6Nd9sSAzTVVAPeAQ6A7Ex+kXIemeJ0MOoCf92g
 2pSExwAP7p0H65z+O/w==
X-Proofpoint-ORIG-GUID: ssAyAsyIDha6k0YvtzAOGDNQo39NyHdJ
X-Authority-Analysis: v=2.4 cv=QpzLTlyd c=1 sm=1 tr=0 ts=6b09ddca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Fn2PsjeflmwALO0ttrkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ssAyAsyIDha6k0YvtzAOGDNQo39NyHdJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX+vJwj2GYEC31
 P8HMcxeNqn3Gh6QRHpm5mbpV3r3QelfplwhODK1tsF7G6vTxo9q4nQB11JykaLmKi3RZZ4r+9JD
 nf6BJl3dkfAKNZedskg69eklXY/7BhU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

mdp4_kms_init() enables the optional vdd regulator, but only its error
path disables it again: unbinding the display leaves it on, and the
regulator core warns when the devm-managed exclusive handle is released
while enabled.

Disable it again in mdp4_destroy().

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c1f61ecf800f..cb95a492e070 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -152,6 +152,9 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+
 	mdp_kms_destroy(&mdp4_kms->base);
 }
 

-- 
2.47.3


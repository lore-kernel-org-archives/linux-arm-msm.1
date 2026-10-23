Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743236;
	b=pkXTK/7kdtqWTt8vZmxVlBHQnJU97Wws5qszQSR1+ItCMzTKOjP2xKpQ0SnH70Ia5XJ+
	 ebUXUlH6Bu7q+tXMDsGBVERm94GuOeNwdR129SH28D0XAPy7fm1rf99rQiU+/1+gzcSfb
	 OuAm85BRuafGJYE4E+47NswOzLdveJVueRC8ePMtYJ9uRVe5+vVMcjHw8XA2tB6pbXYuG
	 d42pb4cZ52LpBnUmjjCRmNm578lmCqr9gEYOBMnYi9Aa6HOqTSRSV1dInIY40U6ION/ft
	 xp0clzSgac0Hjx5Kj96YPOrC1lr0+3L2uJc9YPrSQGFhIhWfg7kjpneE1UWhywdZ+Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
	b=Vsy+780LovX3eZW8qGeJMiK/Lx25T38SbeGdb1NXpP5bOMMtULFY5fNU2idOwvEZRWFV
	 BA2HaF+ftG5mpNwi2qmwA/hKGNvEY28bCCriFpYvtksV2h7JS2tNuHuVBz1dH3PIeuvja
	 /NO4xDS4opx0lBtfv4hpXLzU6tM55EeCioWZRGxsCmqnAfSJQenqkPTHxRFBDYtyRqM10
	 8C2Z3X2Cu6rInEyWraP7R6o0cdZaKE8HUEc2Q2LohUTO+XsEUJLqu0nuSrxkHNE5p2OBH
	 0KZktFbbmd21gWT3bv44/r4Eu7i4yQU/wo7Fuv/U6sihb6ycIGeVsEWoameP9ZHY8ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PI0xYDhQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0aisfE5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10159606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10159606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PI0xYDhQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0aisfE5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FSR3587751
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=; b=PI0xYDhQ4saNVgKA
	yA/jd9zqnE1sjB1euDP+1H9mg9nZaC21QRdCTZyvzTSWv1juXqVm2CXZEShk1Su2
	qXu21l+QZIq2RoJKEaJLt91vgJH0WFwBXodmouE83aKecv0z3rtsYa7euEpxDTNW
	B8qUamqPjmhEmL14DwiJrfMFBxxkxRRN5JIZ09tuR4XpEj0g8LeHDjp3f2qpheF0
	FwaGzfeFiZAfouj2rnkK3WQT5H1t1PL1tD44w09p9DTrpyrtQCWMzgY4akdc+bq6
	g+2vR7ihX0uK9b9KOL+YCVC9bYIGK3GhWcusXzOk0YIatC40ZnpMGLRamEtw5Poz
	9ni4VA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmat55p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so115410685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743234; x=1793348034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=D0aisfE5nx6Uf6NfOeBj9sqbzSO3q9xyJwsNN5lpEZM+p3vq3sXOVVjWC9GysDijI9
         vfd8+6sfK/iQqVwSzumpbODDOkSfOtZQtZDkHGqUu0WFUGW0TA4y6jtiam6rDDOlviY0
         xCCN6O0e+eR6cMwBnr3iZKKRHIStsCfnmP98/CtvPzEqLbwoGBR/MCH3slsToz0vx7oH
         cX6XZFWdF4Bm4ulWX4KSINeGL7hzxQCwF+j+GZWlqQslKZFANlbldLGkDKD0mGULoiMB
         NlVcAwj1KB6qgzjAwb74CXMVglG6YqtHPoyQpN3jTr8wXiLKh0z6aePOTwRrnmFJ6dm9
         hOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743234; x=1793348034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=htc5Zele4sOt6O5yUiFQnK68Nwvs67Gf7N15R9tz4EmQtO+j7kLyKPg9yaQJpUB79Y
         jKEnBnx2yjmn8cnYdLsXYyylA0v8JZVM1Ad9yq5qKtJGMGVKWBMncSZbiWSf9+Wcj0Q/
         RNjZTsS0juoHmRquEEkcr0hWKjChvnL9mIlK7OM9Guix2eWS6vetiRXWk3o6yM3H82Sv
         Mrc9zguWw45Wi9+SkL62vDFz0F1T1U0mkmYYYZWKrpbJvt9q1S44/J7LmF2twF5deXb+
         VZimlUicMNu56zRBVG4a26HKjOqy7vz0fGIywGUJ2EJa6eZRhVkxEWUVQdL8caKpfW7P
         Hh2w==
X-Gm-Message-State: AFq9FYLAqTFb3ByHXFYRXl+0FUEdQ6gnXI9uWSZCwH8dsXvCbYXnlZ5w
	QDVFFp1gSRDYEcztZBArTVrJn0CPSny0Aq3hZSjKSyDWiriyTLNPwTEQ8Pa1DsilNrmmNoEiXCN
	mD+AMfUOlSbkVIFWZRe0YphRClPkRSFRjmNPlCKg1GPL4OrCvDObMvfBFJBa6/S0BYhS9
X-Gm-Gg: AYBFou3N4pa0k4pFBaXkhl38kNMD0+A7x+5T37THAjF5lixLD/uJSCOfjHdaXhsiHTP
	rE+qQkPBHoVeeLJsf6m/GnrWIUgWVDrdT/GSVoyu0tRJ/NtWRHAoELV1gNqF9A+KLxG07qzjopa
	RER3oLFFPQm2bxiDt7urNfn0xBo2jQf1Db0PrzayOa1gnx81W6wXHSRhhbqjOsCfwsklUPqLuZO
	oi+V02Jj/ut78hTmn8AMfMF1h8hhPtfFG4ZDxOAJ0hE3IH4VoCpaXhtXRK3NKT2i+FRgzvevbIZ
	xl0e0boiT/8hQYD9StHGBnAz0yiqcJNPb5KvSbR7W5tjIJableHXBe9QwhlShMeIAfdqUfV509p
	ssGQOwyY02EOCKRMT+6YciplwZ0NWUATPw7CPalKH8M3+azdXggchhk8devyqJg==
X-Received: by 2002:a05:620a:4483:b0:93f:2a95:a503 with SMTP id af79cd13be357-93f6f8a89a4mr288285685a.67.1792743234258;
        Fri, 23 Oct 2026 01:13:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:93f:2a95:a503 with SMTP id af79cd13be357-93f6f8a89a4mr288284985a.67.1792743233908;
        Fri, 23 Oct 2026 01:13:53 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396af493sm14345626d6.9.2026.10.23.01.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:13:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:13:13 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
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
Message-Id: <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743200; l=1229;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0e3qRwa0eUGU6w/ynL5P+jJBBY2ZfPskYSfmy+rlycY=;
 b=tCI/OGTgkGp6W+rpS0APS7T/OQoO2IecXPOreqBc0ZRsu/DSgV429WyY+mj6uTd8rzy5KXdGM
 0ho7tGPSDrKDCqhc3hlXbGjqPj7b0WuzMT/94IQghTX/z3mRIiyaWpd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb1743 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxzblfksYLce+
 HJfQfkSI5fyy1+eIMaxALto8WlihRNgei50PqFfsV6aB2R5gk9Rh1DG2vG4UJYDR9t+b6bR98DY
 encJxCoZb0WTtA+5zVM0FVG6RI1TBhk=
X-Proofpoint-GUID: MBM8kLW2m17VZyzYnhb-3pp6vT0m9K4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX0mLLPSDFQPAX
 cBtM4g907WPwikT0EWqmiXANAPZSRkmBVo2Yvkw3IB6HmMAuFU1RVlZbn+MtIuCfwxxUWhhI0P0
 C9ODPGMXZ+O9u/+B8klG1XFYD6k6RCD3f+pevkfGuCoaEQLdKQuqGbe1rgPVxd4CIADOxvFimly
 ZAHG6G6Qno+OALBPr24Z6Oa3fKfACu84tu1TNmtq278/wFt/kefO5qn/kB2CCqW+VyKnICCYydk
 b5HSqsmdb1lE8yBtHPfoXiZH4YeV+ZahO75NnF9Q6J84OAghNaDcxcqYuxQZlff/hdTxhEud2aP
 HIsGrYAvJJtkibCHz0vHvRUtD8LVwdrJxWiJMBBENqXLXHRM6qisKl69H91HmsFtqZHWRdkKd4T
 cJakqgcHBSRtXXiQyIfGYAeUfnr2sIZAxxNGiWJhfn2FZb0jl8FPyo5W0sTFpQcHpylycPcBKWM
 HTIMRhZWQrciOBxZgsg==
X-Proofpoint-ORIG-GUID: MBM8kLW2m17VZyzYnhb-3pp6vT0m9K4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..98d367b9dac7 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3674,7 +3674,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "core", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0


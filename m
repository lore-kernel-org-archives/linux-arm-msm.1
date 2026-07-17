Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34D37416B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320992; cv=none; b=dulFTiLqQFEztTOjc1W03vcJF367zEadRJ8OtJBsEG/kdareCRIHUWzKRKWaFQAjAPqZ12EXtpmeIzWsZpYLY7G1OGD4dW1eR2Vqv9ZB1qORtV6O9F3inbYIA5yHfjEAIa9JUr21h9AEL2NFuh/cqRAYJ+VvDdR0RoJOz4YkzTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320992; c=relaxed/simple;
	bh=5F/4LhMRQgSwHx4+A7bz1FbfbCxCgdAfchrXjYiRToU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1XgA0LggSjlDPc9PuFdnZ1T7E6mIcBwOWax7gcXQde0aKE3pVcizVOwoOEUx62P8795OdX6WvXiRiiqFxdPzHP/QCNHSN8dcYyBAe1lXChK3sPnoi3tOmOhqEvoOl35HmC5aZgLAsHTvEoYu1H8vp3ZLF2iYO9XW+ddoqHFdT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjPVSzfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKOL6OAy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjPVSzfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKOL6OAy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtAPx2882759
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=; b=pjPVSzfULLlVIqYC
	KHI/PHlLgb+u7+xOpdqVecyBd6IinheCrfAlxjs8juOuAZhmn8PhDTF8i9ugZw+X
	BRPfy6/PSJhwhGZ+zfTBRWW8WlMQum9U0u5lYfcZ49UkRf+JvTSKs8Cna6kG6ZZC
	EMIW5Yd7nYCnutt2+odxbkgiJaWEsPGjv0IpbjGCIh0gtSFLPfpYRw8ieNAoGKhu
	+cCnT8Bv6cf0JiZ9k3GM6nFxD+WkMyJm+6ZTbZk/8Hb4q3Yovv/a8zeFbwM1M8go
	Os4bxaLk3C2xqaLBfHgjGtfTIlFSs/m4aarMT6+FyEpnNMrjJ3GFqmAHIfp03Voy
	s5xNRw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrqd8r5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:43:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380b630c505so10097850a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320989; x=1784925789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=;
        b=cKOL6OAytFf+BYzPwTeQIiEYo4WyZUwAMmSeLFP8bjhy4Law+ZUPFU8BOAWocXigpX
         xI6+eMJmKK6AziicSfehxV3qAlTidCYa+EFbQ4VTSNPEyCPAPR3Av9BCUopwvPS7JKc1
         ss6JCuDRSKZhz5XU+6pRQAgXSg5XuZKFTtGw81V7ZVpigOk/0YfTYoY5Whikpcl2idxC
         jBtrOKcuN9f/xQ2y0kGror4uUZeLv08AR/0ikJdMDsBknnTzSXuG6+ykKq3REKbPfiFp
         lcs4KGNI6ECIfgS8/w+6URwTEP71TPiP17FWh9A2+SGy2wUh7efWhrh2Rc1k1cGUp+ZE
         k3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320989; x=1784925789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=;
        b=Wj9i8DJgNxyM2YwT3QpUM/ZDx61G3ECKnq8kGYvIW43zzlFSa4J/xLh9+WxKYv5u90
         JxaTs8pLmtdlzuS1cQoxF8nJLmKvYeprUjIls0klui10Im4WqV/rQwhS8jenQutvz4rc
         78ucrdjzv1IFL6pqr+NcdLSRTkeZgYevppJZRTaa0XfwrfwJYLtZQQidy+eElCnm/iT1
         Q2KjKqi86quNicJ25W42jrhPLyIdXM17qrrpEN4YRQdD/dz631bESjkOzwFMXO2oYpUU
         q9l6bQn6WNBqct6HNasQYTr0MMeW5Wr1vxfJvz2jtziKdF6ent13R6S74L+IrEkxumnG
         MkHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMq+By7KU+IkptzLh9d+bZZH4Aa22VEThjp7t3nlz/1c2AK3opE3Azg4GEzhPIbzqIQNJFxsXFI5X3nDZw@vger.kernel.org
X-Gm-Message-State: AOJu0YwHlTQaq9uwnnID4yszR/sktFyCc/7fnUxCE91UQLyO/IJ9fW5h
	0F+1z+963dF6hW2Ywj5K3k2gEWugZUq3bSg+3ChuHqSEDxAXnc4eeZgoQaxNOqY55CzI/Vfe3qY
	CrWWQfk7UlCqxAmVAUx+Az52bE4pdDIxPIF02bEChBe5UOxC4blYxisCHG/vgKKtitoXN
X-Gm-Gg: AfdE7cmXWy1cEd9L4W2tHhZQ4mcEYfGATv+MDylIsB2lxeMil5PlH9xMjcV2qzglLEf
	y3SPI0S+qIyXfmrj4XF8RiA2ej3KMorPYekULeA1NQrHixr2qZHy2pu4eEP/6PpHx1b+/Esi0fj
	34HXomfBal2RSDQPudi7QvPXRbBVLlHPh9nun/r5F0fqddu4V4lvxOSW/SVdvQISs4bSyfRzffx
	pTaqRXEmLN1i0ASrGuiq0/mY1lUs0rMvlbFHHam/1MJYbas8FukdLzevoURJmogxADzTGVuU+sy
	DpAC6aVSuboxyxlV/su/gQhGF2UxyJGyd/fILU4nq4PRTKheV+2Pb0HDRzEJxRwaJCr+5qLlMbe
	Rz2nTszM4R6V2aWsHfg7/KBTg
X-Received: by 2002:a17:90b:4ccb:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38e4b57c2edmr4367657a91.38.1784320989061;
        Fri, 17 Jul 2026 13:43:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccb:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38e4b57c2edmr4367589a91.38.1784320988324;
        Fri, 17 Jul 2026 13:43:08 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:43:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:34 +0530
Subject: [PATCH v2 9/9] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=826;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=X8RDXfBHklja5EB34gmFlxaH7HzFaYeX4Z1IBHMoit8=;
 b=9Q8iDnAw0MhJOK5ZVzp6qxDBJ1QRxddOheLScWmDbidXJrIMQnonMmlM6v+PtlCEEzK/dtESK
 DatlP1RAZO2COPGL6D6h9BFfbWY7fTmJpoXiY4tftEFy1+oli76Z++j
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: rJvYWBdyJ_p3V_Pv6ExRi88MPIXLHXsI
X-Authority-Analysis: v=2.4 cv=DbYnbPtW c=1 sm=1 tr=0 ts=6a5a93dd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: rJvYWBdyJ_p3V_Pv6ExRi88MPIXLHXsI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX3SCZdxM4s7hp
 z4K4fqR4mCvrlY5ubApuCGm5NHFuor2cNz3ie1KnBf/nePXxBXMEeW34tflRiLvv2ZEqD6XlMmO
 RqZeUNYLUw1ahgOZWtHkyMi5mq+4IBg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX8GNfXmuEUqMs
 /ValnzP4noPSXeaiwA0VUcYm57cMkMPvk+p7n36GpohlnQzqPx6j6/+XKLwAH9+61OehqV1ltZA
 OmNuYRbdp6ruNbu7E7MkH1LaYQZiko/9YOmwlVxAK5PY/t/rssTP2KQRyhPF6GOkC3WDg4snN7P
 1gEUvlpmGU1HtrMTQNKJsJEw4C5F2dtFHNDhT9qs+LuBLzemlwLth06/CO2nEV5+taPPi2XroFo
 +VzvJZBUdAxhoqnynB+cem92544nYjuOOcaJQhCCBHmtvnn/5Z6NCdSJCqde3bOZu85JSD+CzKw
 60txpCN6mGoCRXKpWnXPQFpPu8VK1yidEtwXRm2Y4mECCTv9K+IRgjJMeUkL2Z5upfmOAKDzbJD
 HpYIDCr/yUTViSTZGOzPXQN5po+sIItBcsP+i2mRj21n2nVgIXmCfc8XsjG8DovQ5bBP+8qGaMc
 klBq6supVumYJUtrWAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170213

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
shader firmware path.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..a6e24d2e3b42 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.54.0


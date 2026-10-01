Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD64A534470
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867900; cv=none; b=brvz4koCB6f3MVDzcKXb5sghPKDUDn6bDZbIPXR0AuxmelhpiFSfhECCmEIHZ7eyDUiEqQujFArd1ru4MHxQJglFKBxjtV5NBWMBWmJE0D5RwKuPUCyyODsIG43Ce2achdU4pDrQz+4gKVjfE7n8ujVZm+88V+jUBWl7myhs9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867900; c=relaxed/simple;
	bh=5KV0AqXX2OEMwqqrKW1yCmYhVV+tDtyhJFj2NfkqB2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bn5j+Q7yNxzZOW2EapOI3/D+PIL/8FyVLU1FADnYqs5FXT0UFBJhAmYNnCPuyVRDLHWoAQX4E9fQA8OAG8h7FAKJLcEVawCheCRiUGzEa2urHBAyWdfmi3IZape3+6wIb2U67PRLcqVXAXtY5+F+/1xXNG7j2OXhL8M8ugqRe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKY/NbOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/sMhD8+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKY/NbOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/sMhD8+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjKsx2830137
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 15:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=; b=XKY/NbOdlUui9Ojp
	qDH3nBxycXpLVRkUUYre34LEk1ujVox1wkIw5Qhqfe9DgKEQzidXbL6CCr+4s7Ti
	G6rVsZCDUgG7O8WzxHjPUpSEkqIf1cqBT6HPCOS19glQUewdAJCEiBMB5SDEfION
	K/kGvsXoW17RPlt2+dhwAwbEqPSNwb0JeILJceYCaHzWXU4oLUH0mzSjr0vFP4L/
	7zRuo4w2uia29meqOsaUIOK/cGIm5gaphMM5eQGJQtk+OUppA9Qahaz2E2vEeH2j
	tOuFkNIQFnNC8jbHSNMNfxMZOZOYG8VOwuQLekouvbAv1V16YAvWgu+K35KQeZ05
	qlQpDQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5bnmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 15:18:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1466ab2bc8dso8837987c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867897; x=1791472697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=;
        b=S/sMhD8+0m025H8h2FMM6cDH2Eut53eTT82jsqgP4si02g/sfZ4NB1hM2o+QBpIoW+
         R0XtHI14y+g8ziI6uvCQRVpH0dP5RuF7QTtMv5PuPj0TYvx0LHpWMQg+VCgO+d3tNU8+
         s8L+q0VziZSbzYnhMNY2sn1oIEwpe667lS70IY2qpJbSkRnNOUFkxnuNq9nLW4SPAKYl
         TyqMQJxM3zXunOMQYXy00fRw5ud0kqIYkjf56oNxUsOWJwpgyfn44D/zpTlI1iqEm01t
         DVAiALE/33I2Fv2VFeXaTESVHLVLUK01DxndcRBtPYzEIO3TMRGibHNAnXT44oNQpuy5
         WjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867897; x=1791472697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=;
        b=jlXdN2pOWCF4oYQ0wmXSRe4DBgiHIwWcJ7ENMoz4PEVzETXF7A0ID/ZR+67Ar3xmk8
         bon7/xcebIyubHUKpjSiPQEJ3VZHQ3NTBcuQUbV5Dd8xJIxLaCANAo1hqpoy0XKVXiF5
         u61ro+qYyCbi3pkCmms0up4Q4PpGzjMtqXIQCFUBjkuI8NZ2Bm3eF0gPO5DS0z+Of3cT
         8FQ78jHp7DuRmtu/Vb99znuc0AKsxanLsQzJFjVsJhh1c12DtAZ5Dv+v8KYWT0DcWmt/
         /NiOk2gRz+xJU4o0yr2KjXnFIIbzbDYdpQ64pP+kRD6xUhgnQV0ifEOgTgSlbshbVtzH
         Dz9A==
X-Forwarded-Encrypted: i=1; AKwUvBxUk0VUkZRl6EdVspokty4iDSdmqKo8+t9jP540hAhKgqlNjc9Ruvn2gmMV64tH+GnI6nOMuVT9dvaLFwzW@vger.kernel.org
X-Gm-Message-State: AFuF++kcUO4G8wtfLKQ7vj6ykaOVCLeeBvBdbYnzezNLn0r7Vo6M2o86
	hLfj6bOOPRKjNIHk0kUNWvMx5S44aJa4OYlJLfa+ni+Lv7eaNMYusjB8Q8jk8wRCP6Brjro/Ctd
	bQn81hKPGDESmps+WS0HSSSlpGk47nQQpFcpA/LiV6ka+xRU5UzTM04lSNM1ytMuzX9UF
X-Gm-Gg: AYBFou0khIiKtxbBRN5ndwW+hQymW5ytWGlgKruzA5f7yEXuwqFFio76YD3UYBC5UXv
	ZdOcK2PIIyRz0tDMm7b/AibuCC6licSNWMFTQwHKSOb2rQP7f4tPzKwZt16e6EboQCRIKUYYqg0
	H6wZNSiDGT4JNX+GT/4JjzbkNgAViZXQnbOEyKthkRMh6kUaozIFji03DhrzrUfH7LYXE5gyoB8
	sp+CkLx0u/fegIozEUAP2BynulohZWo2x2gmO36mUhFAdOjpUyFL3cp27PM7pfSwfT1/Lh0Iwn3
	gE1wIxBGdoSZa4N/EQF/yG/sFR4nrAnBzY+SzlV7dDJP3Ng0KJ3L/rhszzisvsHYriYCobnzkiY
	1chC9rxrpFMypmNUTaGTb740Bkvudxx1QNw==
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr4080638c88.36.1790867897205;
        Thu, 01 Oct 2026 08:18:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr4080593c88.36.1790867896233;
        Thu, 01 Oct 2026 08:18:16 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:15 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:26 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: kaanapali-mtp: enable iris video
 node on mtp board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-6-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=963;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=5KV0AqXX2OEMwqqrKW1yCmYhVV+tDtyhJFj2NfkqB2Y=;
 b=1UY6xzT4aqvUmIBKJTk9yU2ObYQd4Uln0H0wq77IC++vzIUv58JOCkE/GMEFVgPM9tDWAqicp
 oza9/QuBBgYCp/e4rVQ605tNEgEATtK+FAungfosjQPyjxdI4X28TaI
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: JLTGZY166gYjvYoP1IccZYV7842yuss8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX4dMr7Uspk+5Z
 1SbGJLD7Y+Ktf9yhKlAGrXDW+IE1QYICVdumIw52zWkXkwPvY98DpeHwunBvjx7o2n03AYVzb1U
 GCvXykNdrbR6oy6hPNermSKloMPV0uM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXw3/Xc/TUFHUf
 2Bu+lqc+m7X5VWKMu+AMfMtxxmx2UozrnOdFccaRjhuAPPTCBw1JHgkLNILgtMVvtZl1HaryiKm
 rBKILuwQLnk3TwPAikEqRezMJ50cOlFpJnxKgrq/4FmN1x8N9UZYUCOh1lyXYi4+mHPaDV0ao+m
 HB+k6+igNQ7T+CytaZvcgutP+1bF+CQnMqxxCV9iFre4IWi55GriBWkqgbCCdRpTFoL028XjWQO
 hf0lAh3ad5Etgw3EuR4AmMs4Pcs/320pPEJTqaWH7pqoL0mOGF8Vm/uQXrw3/tUmR0+wePN548Z
 JD78iDxtVQWqOiqKgQSz/NkmQrDLx78OiK13ISBH6Ky+FV3x2UjS6ZkbY8kDLesKzYdSeqW+HZF
 a2DXRZcCDPJSvZmD8MWOEqKzvyNgSzaHXoAoY8qcJ9uEMOPQHgDQ/qS7sbo8YEhkDUIpC6+Z9eL
 Gix96PopF+BGkMMXN5w==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe79ba cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RDbdyBABLrhsN5S-fyAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: JLTGZY166gYjvYoP1IccZYV7842yuss8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

Enable the iris video codec on the kaanapali MTP reference board.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab6b3e3646753a880e4704a1abd503..4463ab8b136c6f3999198e159335e3096e181fd0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -916,6 +916,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu40_p2_s7.mbn";
+
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1


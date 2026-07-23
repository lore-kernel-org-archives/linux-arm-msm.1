Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBE53F20FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810868; cv=none; b=ivwmeOqyl/SsLFN1jEnnBzVhaNLWBC/weZUYHQNPH9ap/EaJQkaPo++uGdNzhEqYO5pbAIz1mEIE+bKH53F2iDuIJkE5XbA4D4UBIz0IGJuDyh3E1KgtF+cBh4f+7KqqJQNg5WH+tiIMt1excNyVAkuYvRhDGlTzgM1cpq7i+Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810868; c=relaxed/simple;
	bh=/eRmcbGLD5Z7zb6cJ7VFrcd2+sDww4ph8DEQ4lXRbjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=smNalYoOi7L4gqo9a5x+2m+oTiDYfUoFTi0ByXuds//PSqBI1T4eHj2veEpFgxbR9gvT44ZfWEkM+vmkSTVXZYMX5eMIBJAEBa0ZqyMv4DlmR8QouyuEMgX5SHPlhyDJxh4MVfMiEYpMofCPzUjVb6O0jVQanBol+qSZFt2DH9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCd7p23o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tx8kvhF/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCd7p23o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tx8kvhF/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qk0i3642784
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=; b=mCd7p23ogVIVrY13
	0KKJjDFmrjyvOuFuieD6SNBmJgCnkGuh+I9qNYRL1gil9tLTeSGjtuzsyK5Y/1F7
	lMO//n+jyGTJFUKJu6evKI0YpEfEV2NhkStF/tUexn1rtVVdS/llz8JD/CluxDV7
	WU7B4w90b5xYJlIztwwxg5WTqRqvzO4PHVHy5PBqmjrx3xC0XooB7ugaF4e0pri8
	+DL323SFkVowzs4kSDyZbOTJCDnhY3gtHscFrao3wQuP0B7Sgv0WZKThV38leR+k
	8Dr5sTbsH5TyJar/yH4z8HvbsdDHvQ5CPKUMEpNvW30W7foOvJGujIt/wc0rjbFC
	Ov8hKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayha3ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso9642781cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810864; x=1785415664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=;
        b=Tx8kvhF/a5KFsa92jgD0fElHu5CExBJ93qccKs5IkdMpQQNwg8OyD8zVHc6bjWkxEF
         URfAMIltz4N/RHLervctZtNbtiT+JdMS5U+tmost8lDQPxM/dloQAll3nwWYW3r7BhXc
         LfMYlc4yG7Up2JGyCxC2fwahGKPG57WsAmhvFniTVsHdGVqTfp++hPKbNiaTNC//yh+I
         keaAyS8OY6AY7zIOriEjbEnT1Wj1J9Ocrs07RvHham1cyIH6wBsKN1NNVPsJ+z7HfoBF
         /XmNCFUjikWZfP7NCpQkXyfyoaAslEXzJfyOPcWnElhv4p+mGQZ6nI94WEmAqKa7WPkw
         qSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810864; x=1785415664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=;
        b=ksqmXVzITaOVE3+F5ClheU8nIzKaL6EUMmY5LonMsuyYr8Gw4HNht7pct3UOiANFs0
         WKaqLe4T5KNA3Ibs/tj/C1MvmD/jYRIAR+REuk5O98mit78PTOsApzGxOMmY5VSE8XxB
         hT9GFgxX4KlyQfuSH/6tZ1T3Fz7GAgPeBQ7WA2/mllGSWItXfIJPxux3PHM8tR4n5O/P
         tZovztRhEA23t1umWkMRAOGJo9ZRHCyz0syXn9PlfGoUqnVmJv3xT/50yajMlfnMTDSa
         /Pq3+CILF7bGp7W56gW8JcZNmz9wm0ukQ3wH4X5XUSSW9ic7PQVbrLeLE3oMBaSAAVfR
         YPtQ==
X-Gm-Message-State: AOJu0Yz1y8lqDPWHzZ3KjxfQL+5ZjG+P6QVwMQdoTwaUmFYlwTPVwwLN
	2cXE+mEMjoM8+I4GHN30mAHOCiZu/O0Cjh81qsZ5+yYvo92rh0lR18FlkJOWIVbmYuRCaVLgHJX
	gCGlKb74RuYJwBwd4G91oMRJwvoXDaOLnUkBRUe7SSpy+htc96mQXqJ5+vRD1Z2uTm1ET
X-Gm-Gg: AR+sD13+27Fke/44cG7jg6CZ86SQWUV7zYOnA1P/SqiX6k7U1pzvEoJP6uh5a33afAD
	BPQyeGZyIME1EaNkyaRsFi/vSIRIKBLiDEYDHI1CPmyAUJ3keoSwwnvy5pefcTXSDb27srYNxg0
	RxSs8w7yLsgcbrsTkaJYe/8AV6Z0jKO4jmYRuE1doXg8YCtHuSe+O3i9vscB7UKqLqtieIRIoEF
	iTe0vjwlhYIVdrJ3F8PvvN2San7TJLL0bgmsNBrhlukIfG4eLosL6V44mWYcMuPqdv23zeJpEY1
	rrgy0rGtErN7QA08ET6SozIb/Dk4KoduB63gt1EQhboh4M24+ivg0F4dayCOlOIY3fatYNkbQg4
	oRJyeUwRi
X-Received: by 2002:a05:622a:283:b0:51c:1408:6c13 with SMTP id d75a77b69052e-5283def0605mr24501181cf.44.1784810863980;
        Thu, 23 Jul 2026 05:47:43 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:51c:1408:6c13 with SMTP id d75a77b69052e-5283def0605mr24500821cf.44.1784810863420;
        Thu, 23 Jul 2026 05:47:43 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm14814283f8f.24.2026.07.23.05.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:47:28 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-3-b535200996ed@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/eRmcbGLD5Z7zb6cJ7VFrcd2+sDww4ph8DEQ4lXRbjU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYg1mRxxgZh+1+mmMAyxbZr+BB0KfV9+ylQFjg
 dhiA74onHKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamINZgAKCRAbX0TJAJUV
 VmMED/93DV4FjcnqlMBE0s8Bwq1L3c/XDdM1dx+ftg82dF4wcwOaLnJqmWWMHMETlDkHhJhnQ7F
 F7IGu2WI5LPBuzKzaVDG1nkaMEMNMzHCBr5fsLyUR5xjJCCT8JpJQk3bkDD20EwzTKNDsM63UU0
 injQ1bBapRw9CDKuffbQ7FAHdsOXgFuM5wMOXSFGcvRHYHi9ptUOnDRiCDW5LV+J5vExtUdxm7X
 KxuNne+JbZgEWeXdWv4pNJr1/c/6MKair77Xsrpd697flXNY5aoj9OvC4cXCHAerySDTccyVwZO
 HRZyewcVCHCMztG7+isrASxzBB1saysySiC1AJHos8IARoknbh29O10HINOtxwvsuYB9lb3gomp
 3gcdvV0sz2UxBwui6LCbNSVilD+muxCJD+yJ71xi0q3daCCpTjA/yNhFpszzMYf/0d/3K2Nz4Cb
 yv2p2JabOkMOVPtXDwnOhARobM7Ter9SxKNoOw+vNSYfyCPxoOtWE/ijogH6h8pCyEhu72BWw8t
 N3gLTPVhW7luOB5qebE1/aImz9n5Zv5yaU/s392hBjntFRO5pbuvHc3KaWueZdGKn86ZBUz+8bZ
 k8fPJ7/SZQejD+JKorDGSlDSfCQaG8P+89xAnrdDw70etk4XRHxfK0HkwqcxPzCA1/nYvD9Ubjg
 bDb/9P0T20aHlTw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a620d70 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=27Bx3adQT_mWtQqGTPIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: v6l0PGQCc9vgomtPGmn2ab9E0lb6N9_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX9bnn3fOHAM3b
 uwaqrTI+bxHq5Dkl4jlDm3suXSYJGwohdzNjKAJ91RVBccMNPz+e1dXCvys9xHjBNZJzVCGQ9hw
 2jFpTrSybRAeit1xT1RhUYkYvxnmmexbN1mAEhCHLD2WWKs6SARTfo3VtFZ0X2LeCiuGYfIXI0v
 wRLnZnK6hYsNsfBrhtbchBRwtLZ8GFkenEYec1ZZ5CjzIdQIk9DzmVN4GVLzXiCMgji9nm4KnMo
 NPtWuiNFvV9saI8/neaTdIN21aX1t9QEC4UJSkMNlAqW7CKK4SP6xTcYRYXGS7c8IV22Qt1CPdq
 yreu22rqK8JDvxZVXG/e4zczWvxB/VkhhtjCGcjl7wxkdOSHq8Ju75HOw2ojGrwPRos8lSefiM+
 rNIEzU03GhbMp5LAr77G0AGhj6UljJJ7TF/iO1pAnw5jhR12Dj1k1xDMHwgDU+Gxt98TV0UJ5ZW
 SGVi2zEBQszeHZR27yw==
X-Proofpoint-GUID: v6l0PGQCc9vgomtPGmn2ab9E0lb6N9_F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX4ZA0X5Ig13Ng
 o4LS/dEhzU2Ai6eVv7mfxCpDGVD1BtxQvAf8fcdUsLm/A2sDo1PViggOov/3z5Bv0s1tjpc5qQF
 hWaP9G08+NvMgceRANlA2oBl2DsQdT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230126

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 318ae3c22351..d31267968cad 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -376,6 +376,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0


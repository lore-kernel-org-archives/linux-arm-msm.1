Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D3A46EC7C
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250067; cv=none; b=Im4MNuhMi9llBHyYsSnx83Zzpeu2O1mm/DzA6vplZa4GoF3iWCA7BdoGQnNuogMMbWG2gSoa52Nh0qBw6uEbgq0lruv6THxWfMR52vkLtCnuG3BdlE+iDApN4/Fl8/L/kFK/jznwF2Txr+jaHX18qbjezUE1nSlc5aK79XYJXIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250067; c=relaxed/simple;
	bh=+gdh32F69OHw+gDmza32B4GqDY4M+tbbtDhsAUC3FZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8kNyZa54pHCyB5+9smN0q04Tl8ovjEoRsAO/apkZmDH5QP5z+0n1z2H/lsAh6hZqeZ8uWzANQAvv5xp9g2XNvFXBo1sbLozAmrnJICcq11KHsVZy/NZxForq5JH4exe7ZXtlY5ZOprpO0e6scz/XjMYDwQnIRsVF3oTvkBaO9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdOcWdG8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPGA4wfl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdOcWdG8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPGA4wfl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JA11975534
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4WVsHeU+3s+biTDWVVpXB2smebPfabTddWsJNC4U3k=; b=RdOcWdG88wADEDzJ
	6dchC921X7kVG2aCmrwBk+7rbKhtb0VYpK08ICqRNdPQImO9GhzeFNnkRIQxQcLn
	14tESxrH7usn0dJO7y7md05Txmu/i8xJEI6EmTSf+xwEBtwjP5m3fLqPIL2r9HSz
	thBLw+RAXHSS9daYd1+qehJG+n01MVrdWDBJ3Iqu4Nia+IxHDHCbwGtsSXplJI+O
	6oB2oTIKccZNs/FZANiuhtF98zqbUoJsAP2uPam3TQ7jSrCPy6s7ISIgfamWhy0X
	P2mRk2ap7zRQcNG0bYC5IzWsD5lSzjXBuyJrHbFSNcZ0p8Y6JHJShc94sh7obGr5
	HcQUPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r16hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso608752585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250062; x=1788854862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4WVsHeU+3s+biTDWVVpXB2smebPfabTddWsJNC4U3k=;
        b=SPGA4wflqSKB0jVr1jD/kj68X832OtCAQ7mtNFFGMlCM5JJzYFqimZPdcD/jPBs+9V
         IJRm9XABC9YbJf9rz+e3RCu/nKff+/+7ztp3cg/zfysVvkofZ+5vDbirBL35vXdPiS8X
         DXc99XhHScEx4srR0zNsQ6vO2PdcJmI9kPEc4CrcU9+rC3VmdZradEvDQE5D7DgvzJiF
         Uc7kaU/zeuRugBPllFJMR6O54lYJQ7LaoXkURfZwtcoyfquBn99yX146vqzJ9lzCZqkC
         kaVBvnFA4XvjFVCvn/zjZvhgM3SReSiUfMeG45Bk6zFnIQl4mSOJtnQeLVzZzi3obzLd
         oaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250062; x=1788854862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4WVsHeU+3s+biTDWVVpXB2smebPfabTddWsJNC4U3k=;
        b=fXf59c7ndPXNnLVmvpNFsM0n3KudJi+6A17v6dKfA3AgXJW4vACph9wtYEwEvrL78h
         6/GRd9Jli8i0huqpiaBCjhQ6sQhN1ZwIzKG0vVmfv79TmFIZzK2mvxYv+IUIpBpjJc1t
         5cru0YI8uAHDcpgQ5Eq9B3cvf9N+P0uSEUylyN9Zb6LB6m0+DdX0Fs1iVC2d4ZsC+Z8o
         07mfyMR9f/KhUXTyH1JgIGC/Pa9fIDiPnF4QscqN6G56m9gL+Abwyl2M2mCeTiCJFW6C
         JSN+bRz8gNMhreZLIThwtjysRcgEHQLk1wwM/v9X1w88tunBFrYpDfqQ2Y4X4J9Vjxnn
         D2ng==
X-Gm-Message-State: AFuF++knHCKlR7skzNNogj7fBmetYYo37od9Kt55qWZSH+zF10p1SbJl
	Rf+14yQRGE7NoWGuzCy52UaWB9ZIm9f0s9bFPMaTjc8G4qXS98TswbQOk+TXTCSRN8H2SI3G86h
	rdlp4QUibNfSSvppQ5z6axfPc6zt23c10QRb64jD1iqc4PdhQ3gox+4ngpDYEzxFcdYDY
X-Gm-Gg: AR+sD13T4iMWv6qEhdK42FeSl2Swyp2TL2dBqsDYJHr2uhanzy1H6JPXBIRtifiZS6s
	cVe6ToEP/hG3sTNp82Z+bWoGyxMG9TxtGTXAdk8oltHj+AytIS43N27717BjUNz41frkMhoSaEX
	xX4rz5YxWcXbRoYgX/Ye8L07IqgrL3xOXWZBthRi/YDqVlrTxzi3gll4yibH5fFwR4LwhumE6ak
	oUHc8GCpbzlYQRJeBeJH8IXSKosAHNZIW9zj9/1vebbdCfo5A37N7LvKmr0MEQmotiPfAsjV41C
	3s4bYij9yU0gTgDil3V6lnYnQT1i5Y1T1fQJazz/HJDsnDtHqk8f9M4c7jzVQxtDPRfjoXqxQX6
	6C82rtK3c
X-Received: by 2002:a05:620a:44c5:b0:939:990:c943 with SMTP id af79cd13be357-939138df236mr3383157385a.32.1788250061446;
        Tue, 01 Sep 2026 01:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:939:990:c943 with SMTP id af79cd13be357-939138df236mr3383150785a.32.1788250060819;
        Tue, 01 Sep 2026 01:07:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:02 +0300
Subject: [PATCH v2 05/16] arm64: dts: qcom: honor-magicbook-art-14: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-5-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+gdh32F69OHw+gDmza32B4GqDY4M+tbbtDhsAUC3FZs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloevNcQK/t7XmRougR0C4w3b4sEY24wEPmPGS
 ZB01EW3NoaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHrwAKCRAbX0TJAJUV
 Vi1bEACt5IrCNJwjdjzl8KkD2R4MrfBQmby8L2lVdahZbKTkSAGYL3hobjpp/05Cvnk8wVUHSsv
 6pJb/2L+0NcWXXdBNq5AWvw4+HZlVI2YLVDp/h1RG6BQlXLw8z0CdYAfYw0sv4iiewHKtb42fV8
 jOmvfD19nEfHt5kCJRg+TAhrpLzhUEkfPiBcaXxPG6Bz4942AA0DwgGJZ7p31Ok8ZBJzq/+Q/EI
 +u0pfdRQYh4w4bAzxGhqlFDVFCDF/XCH1nlLFIN8hv52TvNSD3QLhyCVi+o8DwLFrwI3yjvKlJi
 xZYY7xWRsqC5XKEpoJ7ZpI1pN1+uuHSYyemeqRvwHhsnTsxVU6JL7A0UtBtAInowc2kFDBqV/3y
 0b7xQlGs9H+/ahyilYMLe96QiEMFseuVGFfqqJxM2AI5ZwLl/cOabwiNboBHT1hXSoaGFnGIhgv
 1tJg/mLlstQ5Py64PgDemQmwz7PKyys378HjI0W4vorpJgr4cooC91uqpJ9V4b/uf+VxkbFUzm6
 bAbLBD1q5Vkvbau0jTUzMX/pAlZAZMtJGKAbrqcTInwf2ZA1bWYLiORGP99QEcFOScfz4TgWYa7
 7LUFo68pojeHWavw/JUa9SwRC3kleyo614MZXpxaHA2sac+p7f9433Uu0iSnXbwg1Dq/FV61Oz9
 dKPkkZgdEKMcVpw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a9687ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX/ymLPZisywO2
 MmsBw6vpJMDvwDSKj6A5vvjVjf1vF951Yb161pNzvnGhcnaPk3h20kNNj4rJ14O7GmO76MpBUuq
 AAcycFHOFarJZDolznUbNLG72zDcLMjn743DWryPUkwRpoeT3hcYHPd0NY4hpQApAmrB21KiRCL
 lAiIRFw6Za5xBt6yCAWFB7HF0+oziVDmbJQY0y91YEIoMOoaHd65IdJaS9ivDPmYnmP5+d5fWBE
 G8YAMcAD1fEINVRkZZ61490YP7JNQs5oXKEmVaBQj5c8ddOAXKnLjh4iptnuOnesO4btuSG0N26
 ao4Kg4ECAo6D1XAob8i8goo0MJ4AEANKBSfadYKvIxGKaGQt0jhr2SkCoFQu7kGZLD0e8ZG0zOu
 NSwxuaPtD7ZNvXOHrQE/TFYAn+YJ8KVNPtTKsZa4xIpLoL2kZyEzJBYVrk5vXB4IeF3YzpcQeQU
 KPrkfIpCRjWtmEDzn7Q==
X-Proofpoint-GUID: QkENifL3UmrTMlb0KY7O6sUDUBYBI4yf
X-Proofpoint-ORIG-GUID: QkENifL3UmrTMlb0KY7O6sUDUBYBI4yf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX7aYQeixVa7TQ
 GLttaBz6TSKRhhBbsyba3QyXJU8Jm/+tBeWeUFFsQ+UuIwV5QznJ9EP07wf97zPXwQYY+763ztv
 IDYBVWxQz3UZcEptKWj1ROot1Q0sYs0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 21b15fa5f8f4 ("arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
index b70c1e094bbf..a14f0d0632f0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
@@ -1068,7 +1068,8 @@ right_tweeter: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>; /* SPI (TPM) */
+			       <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	tpad_default: tpad-default-state {
 		pins = "gpio3";

-- 
2.54.0


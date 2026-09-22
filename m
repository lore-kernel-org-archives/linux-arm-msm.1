Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E548F524AED
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063518; cv=none; b=vEgIRqpeKU5BwwvnW1cfp8OstMtHLa27OAPYMgxUvvYil+rT0TfKcJsRg3srapT/2ze1h/vFaRkrz18nCwfNHuXr67R4r0BtWusba7WC4xFqgpTB4gA9JkLOC4VuiE6yq4k1ia9HpVzzO9IJjw6jCFky8tyhW0QxmjLprlapkVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063518; c=relaxed/simple;
	bh=79sCH6vRnTS7g4u1Il9i739arc6ypCrjwohBoPOPcRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdAONMHIg5s9M2hiUpAecK3nz+Hsc9SmZcAOoJF3DZm7YxPXD0a+ANt+93zA47xXOQRXpVTkauqjaMRhq6vUzvrTeV9+8hWsiucUaocbqAjW5/1HJdI5veOP/2Ew2WsSHdXAPXEe29G3BgPxTC9slImUlolKglAKD7HfXHSe1GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLN19sob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b48AWuU5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLN19sob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b48AWuU5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M77xBP3840549
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibfeLaQssPMfQeY2RfDzEAdo6ADoMbHmqZJd5Y8uNf4=; b=RLN19sobYqRTvMz/
	Ley7OXViBQVuTus3YRooZrNkSZsTdxy+BJDwREJwHb4intQ2QPEUOwRCWgkyxANm
	hBQI4lPEF6BWrRtaSu0+sQ7OCXVBjKaOsopI43pTuRT2D7kHMex8WWMFLYhp/9Fd
	GjsHXv+l1iBJRMoAHOPE7xxu5bSVC4GPVzdT2rDfjMep2Q/R2Oxlpy2rq6h6Ji7l
	5/DDXH6ExLcenuQA2EB6z4UheFOULB3GZXtfcwuq9+hkJ8REo0Abi1M/f7ylh/x/
	EFhKNuUOMJQYEb8niO1BSW4tY0vRVbInGy8ulFNm/9i27x80mmTboekVWha64wsk
	oDECdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v52wg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a183a0e93so829337185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063505; x=1790668305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibfeLaQssPMfQeY2RfDzEAdo6ADoMbHmqZJd5Y8uNf4=;
        b=b48AWuU5Nr7G17Wft/Nsns0JfCCQBhp/4R+WNO7kYy/qPXWO1ZnYw0GpKybVJTzJn2
         Qfo+qjOutqoi1D5f6oB/bFfVNj+Ts01THJNtcYSJHDoujOLktfZwqhLOYP6MkwUrIHuh
         MDfWG/KVYeBsJolU297HwKLHLtncF/Gts+tiCwsxNT9ZkI60+r5SIWC2BOJbMWMEBfs9
         q9gfQaFi0+rna4AGBMtgHDtsTgRHKOzmFsT0A065joHbFDgPDuEx9+UztKB7vKup3A1d
         iZPyKggLlVlwP7adtSN6nMusFcF9ONp85myy9MBr456dHnFpK98DCwoknPPoLSMvNZhl
         1g8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063505; x=1790668305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibfeLaQssPMfQeY2RfDzEAdo6ADoMbHmqZJd5Y8uNf4=;
        b=2fmguHdL00Q1ZB7syvviTKR57pRZPUYZ9KoBhTUfb2QTObWINAhFM1CEaz1hE/8mg7
         dp8xiOSGF3ftBJmoGee7uUhA9EFbkfrmOHF7guqYQRrtXoo8Gtq+E2hjNFSjOVQwYEfC
         tENxX2ZWGnLesKYdGfemab7TWWP+azcKjWLZfoUNl8SEQVrGlT6lDR4/Y3GdHN+G8B0n
         lzLN1cTk0pM6JJMvnVWVuK+7VUdhMGqW7qRZ0G4yZAYXc6tzFCFnCzPgM434inDmnTfV
         w9+s9mT3rAOiYahPc3scCMKOSSOdMoYZ9SSNAUS6+rqikBxDtYrOye6YlUzMlmg98AWp
         qy3g==
X-Gm-Message-State: AFuF++nOM8UMfKBRqXJ8jGs9Yw9akRajVHcYdV3ZtQue18WuNdwYqehP
	EwWaAtJ1wNz/aGqdiRj3KbPI/ILvv5eTGhm9jLuzUELhF58fxY1dBzKTV6SZ8phZ0OAE/SyBMpi
	hSDioRwrwJminIRYd1/TrCEm5j+kCTZa5m1JX8tPxAM9ctI2cY7Ts7nILBGTARizYL79S
X-Gm-Gg: AYBFou3/K6FSwHuYZgNrLc2arhaD+VkThSmzwjSE0sh9Ngt8ZQI1F70khTTTzigUPvv
	TfBqf04LgKL/4SZNfNA3EvU3EtmHhxXfWNpU2e4eQsXxDFs1T5ec+X28hiqrqB08bl0WcTyubdl
	2mcaaMFmMcRtxXt0bvlKUvamS75nOgKpPh67wQP/uF3Z6L5QiEEgf1XZWZpN+jx8SAbKMzTVw3f
	YLA7U+KTJyaWDDEDybhrVREB3J/yGkNTCZrvgAVFqbBjeWyI8/O1a+QJytgsgCFTSNw2ZYnXSsy
	6VwPN6824Vds+bY3mXjw8QFZ601dX1k2cm9Obzd7vxJ+Z4g2F8XmgH9tyaytpKuMXSu6IVp3ag2
	JpKk9/nfX
X-Received: by 2002:a05:620a:298c:b0:93a:463:1296 with SMTP id af79cd13be357-93c15d86b7dmr408275285a.18.1790063504572;
        Tue, 22 Sep 2026 00:51:44 -0700 (PDT)
X-Received: by 2002:a05:620a:298c:b0:93a:463:1296 with SMTP id af79cd13be357-93c15d86b7dmr408270885a.18.1790063504071;
        Tue, 22 Sep 2026 00:51:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:16 +0300
Subject: [PATCH v3 07/13] arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-7-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=79sCH6vRnTS7g4u1Il9i739arc6ypCrjwohBoPOPcRw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN4r8x0RCd44jSgBCC77pNSBMO5dBCdKoF1k
 0a23o1IAfOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzeAAKCRAbX0TJAJUV
 VqwGEACuW2dbOk6xDhCVFEIwyfnXVoyZlAbcylOhhknFtBWFD6vFkzOha6nGk/XLj4JRFFPeXQr
 +bZcRmFDXdRFkBHAFq4QB1ucHLSKOggpydls0SOGks8ao+8hyT+i6RtHZpWcOB7uRazwYfhYkp2
 W1hn8cVgo1U3UkNNPbpK+S58C3cevcfoqMFlw2iAnZrA0WluVBLYBxgia8n68WlRArO4vkDjcSe
 +WdgjM7y+6Rcs6GY/DPE5MBmwr4kalJSbPMhKF/Z7e6W2BU4idD7hvUoqiVpX1ELirrE3+ePuhm
 GRnuzh2wBYtgza72LfvdT2kE5DEUe75Bizbmpe5GUnkWCQDPw/jmWf1ADtdKiR6E2XSsKNw/7uN
 gPzdDyVI7rPzSCZuj1ws/VNZbwBwhFf7R3lTXJcnfgyUhYxp5en7wTILD2UeTKMQ89dverEZugC
 1Z9bDDhRjoKzQ6QqVK3lRwsw9y21CF3liFXgl3CRl0i2ZzSw6BqY/qnCiKIlqPuG+pHf1aj22qb
 v7dJLZMG5InY7YVISc9plV7yWH/68vJ1tQBqMFj4RT3NEzPfu8ZtKDchNgf3iQubO9DmIpG6C61
 32myM5obMl6fks/SdyAKbAOY151HBTt0W475GKTvHubDfHbBKpb/3QzzkYLhlKxtNNP6SGYgTEc
 zs9XkPcMQ2/vL4Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: nEi29tM4w-4dZS7qNu1zQg6mV7evvDeR
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab23391 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXyVNAdfoR6P5N
 maZbjrmRHoLPbe8MqkmSorlARS1CwrQlIwhdLUnkOqK03sTt9IFzZAFUOwZruhfUZqC0xNkujNW
 ZdtHvIGzrOsmNuhY/jkkJmZ6pY4+oYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXwivQPar88hYA
 pUd6jrO4hWYwh9fYSiQwoYhb/jqT5zBmf1bSXq+3faQ2iHEWSJUfY5y5l6gYUJNK2EH18I4jPOb
 f66mZV9NlnpwADmgHUm0rMnzn4+63VBh93QTvHj25EnX+ads8HeopiYdlbmzz8SI+kN8eHoA1E4
 LbPhmR7BirD4qzt35YNPSXuzNofxRRKDsV2CQ3u2aJuE0fCDcyWZRNpj+4cK864MDr/h81JQMfm
 WhRGKpGNNMxSDWkwGNwZyBPkGa9PaJBtNhouj7riUcneV7TGucmHrpszIpB9yI9VKeX/H5D2Weh
 QlT6FaPDqNaDGHKN9V9twaiG6mIvcJZErRm+QU1eUE5iNnZCTXZTtIOgKssIN0iyfXqQLzeZp98
 2fV/MgFQAidES8h3kj92J5SY93z/8F/iXY8o3VF4DZcC3kRiz55bVxXKyouAwQyTvyPyBsRq2qb
 dk1Tnl/VNr9i7jtx+KQ==
X-Proofpoint-ORIG-GUID: nEi29tM4w-4dZS7qNu1zQg6mV7evvDeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index 6d26d73c18fc..9b599917c15a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1268,6 +1268,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0


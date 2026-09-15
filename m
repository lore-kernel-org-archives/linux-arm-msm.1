Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAFA38422E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473829; cv=none; b=NLRqz39tVFCsik1oOQSvkOfdJ3nuwye/VfalUEWFgjAgexXfvatTXf4Ik5iPba1v/iOKrLeiH8/TByC/RrCGk7vpEtO1BbQ1HkXeuhTWGX3RdGwozqeClJEV9v/BYeZKgx/MeWkKpX2/aWIkCWYknhUeqZmzPRVapsNbAVms1Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473829; c=relaxed/simple;
	bh=aKuI8YLaa+odlL6NCq6DFE3zoTnZcP4u/fXtvuWGG5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pci5SSBij7bUgEujqP7XiHmF02g7iH0tX7RFXX5DDkACikN6LlVjLAwMIg9p6Qh+YTb/1PMuewWFwLdiX2PA+RxmMg7GTqvEMOv3IdBech+dCIOCGoQixDv9fG6BTgsjH+yZKoOVz6Kxjwk5+zsOlekdl7TIZdTtM+aF0aAEcaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWpwtCbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AK+VSk7g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWpwtCbz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AK+VSk7g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvJv275512
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3iUKWMqrkMjcgQnlSiEijg
	CyaIZFaqaX8CYpXtif2m0=; b=kWpwtCbzwGPI9YZtlcKKiVs3nJSXVSML+yIfOg
	qzoOPcFzksSop3A40LCtQ9dEOIxj82YU4Otr/S8Rm6M29Wp4M8sfoVBASEmsmdc0
	p3/vLo6+l6eSSAHGqEWQNDsVY96XL3FWDSxL5bBPHBVVSIhF+lzLJv7EuleLKkU9
	QvfUi8x8+WUd+uYgZEGKpwsTaNrcbqmXBHHbBNteIjmvhoZX9oDy5j9RkE6HwO64
	C9fn2/8iEsg3kIRzN71xkNKIjKGnq9P1/1xpsQgLEqWpfzYbwV+r5xZ5ovnWy+6S
	+IpLwGnENIg/hBODqD6wQbSklGC04+OQ/2ZSipYbPAjkGmEQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea1n89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:47 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-80497c6ec88so6356612a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473826; x=1790078626; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3iUKWMqrkMjcgQnlSiEijgCyaIZFaqaX8CYpXtif2m0=;
        b=AK+VSk7grNSKgP8nizfTkNbHO/XyMBHofNjtuqxbVsBhT8KH00m+Ica/mnqGDxLUhh
         ea7Poc1LGDtr3bf1ZysxbVSl7z6PO4yK58VTj6NcRWlVhk6IJ3s6AGwozPRa2hlxthpV
         lVmhJ2Y1Rnw6wTEGp9Jt2LkzTNiOfBAAOJd5dW6+Lnrchx3ZotrXLb45JEq7JZg8yNl+
         QSKxLhNC3HZe5ju8NV78Ih6MWwnT+HEgMX8HdzD8Svb+vrw0MEeTguTi6ZSqvvofBi9+
         skjyJEDJU74R36zmDHK4iH3H/qCvwRNvj4rSRhGNAmEmb2Gpl37W5xK8LLE0CGvXcWDt
         JhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473826; x=1790078626;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3iUKWMqrkMjcgQnlSiEijgCyaIZFaqaX8CYpXtif2m0=;
        b=Cu+GbOjpoFZ6fmGHj6cvCDfd6u2yGfi/nxNDAxcQodjePDI9POJKSp25+uaK4e2BcF
         LVnQBctlw/bKgyJ9itsGTyzHYMUx4KA8Lmk5rCiGxQ4uxX4itjQqVSjj2NmwnVEMa63s
         sEzYR6XajsKg1/SLQ6xD5hUdPQm0LFNISSEh1zekrND7MbFaqux9JSKU61Cmj/3F89ZF
         aRZCRNUyfrw6YQEa8oUbcp5U0O2xx5EpI7LqX8LVrZIPrGuAKDHDf2yQw5gmEpozI0qR
         irKuZHSa9Fce4YdsvSBoreLS7m0HvvJYKZ+LKgpRvz7ZllfK3l0Le4EKLlrsCuGyFJvc
         Npww==
X-Gm-Message-State: AFuF++nRz8shWUZnlo1Q/2Ph1oKHIs8WsX+TDyV0AJ+RJ7AK7sx4b+av
	HkSu9nMPiVqrexnlg+IDEVOvon42RnjMvDt7E8dbxmbEvWeO63lkQ1K/Q6bMsS4PYG3yIRrniIf
	UoKXO4NAP2tc4AKT/hcCKTr4lcGJ67DLBb4q9DCGVHTRk0/QnohISCCOXg0MDCWxFYYwV
X-Gm-Gg: AYBFou3iFYsBgtTwszK85pcZzerV8jGOyhwBky67PIuE7vqFC4vYHD0Aq0zCQpp7dxb
	Tj8/zZcPytp4xUDhHuLCt+ezMYHE/bBbbFLZppaXd1ibM/NeaFqLZ4Bu+HPe3bQK6Az82wfCILH
	uuR1qxvMwosDEStmvKlWZ8MJocwGu+B8VQ5zqv/sgIAGNKyzknfwo1zgzBaLwza25+o5V5o7glm
	6DxiNp3qJ4Mv+GDdiyWy+VCnyjr8tpGcfXGYCTUVkU6F9OfFc5dzU6jemWdRrbx+NxsJlaRfne0
	Au1EQnGDR14Qb3plsDd5hCholR9xSlu4B2bzh4KQ5ZItoy8jnuE6rKC/tYPLFegtKnY5hr2HMCn
	X9zXCDVQ=
X-Received: by 2002:a05:6820:2918:b0:6b6:c0bc:365c with SMTP id 006d021491bc7-6c54076f315mr4194726eaf.22.1789473824398;
        Tue, 15 Sep 2026 05:03:44 -0700 (PDT)
X-Received: by 2002:a05:6820:2918:b0:6b6:c0bc:365c with SMTP id 006d021491bc7-6c54076f315mr4194390eaf.22.1789473821773;
        Tue, 15 Sep 2026 05:03:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage
 subtypes and rework generic parts
Date: Tue, 15 Sep 2026 15:03:26 +0300
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA40qWoC/42OTQ6CMBCFr0K6dgiUCuLKexgWpR2lBqh0SqMS7
 m7BC7h5yZe8v4UROoPEzsnCHAZDxo4R+CFhqpPjHcHoyIxnvMzqXID2BJOyA2BvPhKk1jDfCIJ
 0Ro4eKpHVXJWqOErBYsnT4c289oFr82Oa2wcqv7Vujs6Qt+69Pwj55vt7LOSQQXVqCy5qlFjmF
 0uUTrPsY2ZIo7BmXdcvdjZnjeUAAAA=
X-Change-ID: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=aKuI8YLaa+odlL6NCq6DFE3zoTnZcP4u/fXtvuWGG5Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQVT1x7HB/hN1XnpOOKJZTIU+2EOXBtq/9Yo
 a8ZLpnxSBuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0FQAKCRAbX0TJAJUV
 VkIBEACv/OsfjtWMvkulWkqQEfy8gVGBkkzN7zYzrZdWB4bZmU6y4i8+4QDVkT2wD1CQRMvfRaj
 sCc1qRn7lDFf0DXtsWbCbYh+rhqZbteEVEgPui+c9mAfgDh2VqrPloBDMUY6inoIeVgHNfSrgcC
 1RuOZ/Ke05T3wvoPF1v8BEawKAR3JBQvg/u4TJrB+wm87Lz1OC5ozfgapm5A/ODfM+U9/tqPvso
 TgQG62c4ceaXzgsD2pg1eYsibbuAoQiAfQNyvOo6zir70EIFOFd3rBjs7uclu/2OT/pkYc4Fli5
 iMvDv7Ey2dt4obsWYS2I4DgFXv+T0QyefuuGxOn6NOx0MMozm6lAaKLAdRQbDcm7g2EV2ybB+sA
 kbpsLTK0e13Lmb3+6uI74xjXYuy/YimDRC74GlmXoUQui18Y1rVL0yONKvLlgvTJpbNSgUyx9Aw
 b2xNh8QbKOw6Bh14yYRPvjqg6pqGlLPeYFpKVbiJzX8ew6oK0TQUzcy4qfAA+j1+x6+GPyO/okV
 9oeWW6e1IawmgHD48KHgZAjyh39Joqrf0O5uW/96rFT/paBra1zdiXXJ9dfNP6kq+y1bLmxk+fl
 R4XNehR4XPNUA4ekg3GZEc9e62Fy3NccNfnvniAj693gmn0TkQbc8OSOuZPvELeMPvE2XGK3n5i
 uJKHZUEjkl4Pq0Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: mZ4mIImy0HNB_zs2WvbReDLnjxvvRruF
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa93423 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Ujb343AK-uRHTq2VCXsA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: mZ4mIImy0HNB_zs2WvbReDLnjxvvRruF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX++L/EqzQunsl
 G4L9ayVARKSW3eyDY+8gqjSx5HQS2trZsx6PKfX5z9JJ7iBAyMkD+o+/GIrYHsNerSi6PMPBiJ0
 VMyX0D6ec6EvSJIzKwO3XtEix4Y58o8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX6NlaQuprFF2G
 c7qWf0EzNV8mtQRzJUCKqafQNcFeDFxn9UmkxCGyRHvBmXPNAtPt3PPfGb/hOoCObjFelB4z4DI
 xCuTSG4Yr2SlQ/NEAcrRm07woQDiGAYivPdYoCHpKn05JXLJw9jKLMkep4bkQDnkIbc/VeciBUo
 oUfY95JjXIzRL8F/RuQHkHJmFAd50PrFgg3fKnD83fVkHoEd1XSc1PknmQxznlgo1GE7Da9arVv
 v9PupCGeUkOhcMQ/lf1GYKnJYrJGt2pgVt0dhs0XG/dlUxBFHIOH+8LeYMd2ruczM1jQskY/LCi
 Px3EOJN5jlT7/k4VaYkUUQSIekbSXsi7MMPm438gJK3qB+lsIMGynTjWKfhJrOneTSk92Vk5tXr
 1e/nrjmjwBiLvDx5sipNF1XV78NAXEZrwKj9vQnGnioKJ+yWHg+htyxQ4NkjZN8QpEzPH2FqUYG
 40714INOGJlVFFI7LgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150174

It turns out there is a UFS variant of the Eliza CQS SoM as well. So lets
differentiate between them with -emmc and -ufs suffixes for DTBs and
compatible strings.

Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
files will not affect any current users as these boards have not reached
public use yet.

Also, move the sound card support from the eliza-cqs-evk to the generic
eliza-evk, which will allow it to be reused not only by the UFS variant,
but also by the Eliza CQM EVK later on.

Changes in v2:
- Actually replace (and remove) the eliza-cqs-evk.dtsi when the
  eliza-cqs-evk-emmc.dtsi is added.
- Collect Krzysztof's R-b tag.
- Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (5):
      dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
      arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
      arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
      arm64: dts: qcom: eliza: Add CQS SoM UFS variant
      arm64: dts: qcom: eliza: Add CQS EVK UFS variant

 Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts    |  18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts     |  18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts         | 155 --------
 ...{eliza-cqs-som.dtsi => eliza-cqs-som-emmc.dtsi} |   0
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi    | 421 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            | 139 +++++++
 8 files changed, 607 insertions(+), 156 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


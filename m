Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A49444713
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109454; cv=none; b=WBsR0//0C+cdsVMChyW0CwCZgiUDWsnF3+/b80L6LFBcVJKyXBPVU+a8X4Lep5eWZCCTIkLvXyOrNvl/ivZiJDmzClrnAFDFusnMjKjzI/ghBSXBqcShtO1BDhukxQ7Z0atfRCyK9sgcvExm4KtaOTir5KH0q0bYYJ/A9ari36Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109454; c=relaxed/simple;
	bh=54AH0wpcG9YpaT0g+nIZHW5mTY7n0dyJOnTEuoBzZsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdpiBJiYoQCGCsg0I/pnLJ3k1noLGUqkn7e65W48P/5FwFhW3hdA+QdkHBdV/zjeV/Thgz1vMSxr+5m3wT7IKsWZbh9rmIU5Bm0VujNPPkJjygZKXHLM0nMG4uimrECDbMA5n/jjYMxykcpei64Z7n6IsTEF6LyCrJs1oo0xXXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgO2XSnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZ2+S6Cj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgO2XSnR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZ2+S6Cj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kJZq2695747
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESjwPrnEIUlNIc3yLIKrBbkMQbbO/4n7ANjjFBlx9Y4=; b=UgO2XSnRqsQ0n409
	FfkzMdmNSg4faLeQsqjp/TbW1E4eEeZDbXNvKF8ASuiVENXjlwpsLF3f4pGbdBYb
	wIVBIdJUOcPiY15Utf8GfaCA4sALd5Rj2wm53gg/arufny0N6FCLpJCNV3O0cAsS
	IXlbJ290Q6+BoSZpFevzgOhODBlYlN7Ipi8HcSJG2zbdcdaXDzagq4XALJtDorqF
	MGib7O77ZdrCc00AUWR4F3aoDFvm42giyJovSf3hCXuGIYm0XmDTRAzjQuzKVBiw
	Su/wxtBpnquaYO/t82mcQX0iRfvyrKMHdxxuMpf86KAb68rbG8t/f669EPeUMY1F
	9b8LGQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfg25c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b10so780788a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109441; x=1789714241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESjwPrnEIUlNIc3yLIKrBbkMQbbO/4n7ANjjFBlx9Y4=;
        b=UZ2+S6Cjr6upZ3rS1ylzBAcaMIrZ+bNFGyRegPUnzZ+bY+N1hrYduNfNz7QnWMS6NA
         +t1d382IWofjXDbIQHduJcpRBReMy+nmwqoNkSLX89tYyUll68FjUAF3xU7bFQAGYuwp
         drM1O7NbTiRRxjvMFn1Zy9WLUk8CzcF/qPM7BK9PU4FDriOzQS70C6rtVauWIG1ioc6X
         7ln21XOi3XKA9ge1SY4SK99FmNeW56in2Ux6EbqGrczysYY73oFKs7F81ZsepNE9jYuF
         KYDPppze6R1LaTKes949WhYQZP47zzaSN9sJvGMRg1foLcDmWLpE88b2kdJ6VyH91+7S
         4SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109441; x=1789714241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESjwPrnEIUlNIc3yLIKrBbkMQbbO/4n7ANjjFBlx9Y4=;
        b=Us1ctUqySJPvjCWLGss5b+3eJ+1rD4ntUeGMKXfmwvDyZozGnF0pSuVvSaVmdzaxk+
         2mM5eHD3dyOeB71ZQ7HuzynFV8EyAkczxxbWVFTgVjYQg/NXxE+DBeGTMq7nIx0c6LAd
         AyWZgocZkFtk7jFF/LlBD69nOCm4SWJXIurL3wFoT2Nn2Uyp4JTsA1a6Y9PK15/SkBh+
         fYNnoWOnronhBJrZrepC2ST/Px2ZrAXiC8P5umlEW+ZKzq5+4YOsHDBdhvR09TFoe96I
         Vz5QekSdWw3GKhu2jqhoCP2uE/0e8WWmORNaEONUMsNKzFra2nmXa/bbIfXuD+vrqn/C
         nA4A==
X-Gm-Message-State: AFuF++lZltTwHGVqdrrF2utZdKwbA+Fh3VPuvHslxNB4UQBi1nNKkZbI
	/jb4I8s/ySmLL9FdZFo9c74B5VxPe5v/OlPgC7x4CSgBRuAIzXD5UudM4qr+RMchbGnrMUjaDF/
	8hxHzq8i1jM3lO0VuX1OEKssdmO5T/E8EKVEdz0njhqw93xjAS5ukVwtyaoqXDTHqWuSQ
X-Gm-Gg: AYBFou3SDSxGX2teudWynnDKbte1maFiD+BzfoFKFnYYYqBWx6aIluluRy8olUAp2qi
	AAwnNjrnXNIw//iH9AQ981A/kR2HCTf5ptfllIknfU4KXMv1DPFkkU+p8BYahaM0FnV7vbvuhgx
	7nVkbJUOTZ3QZwPAVuOAu0gZrkQfmQVEyulfz+R0FtKvjR4x9pFkkVQ2PTeo1X9y2GB53zjCsIp
	hiavUtbzsmWlikoZyYI2ESAoazRSu9wdGPKh4JK2pOIKMhjuGRybk1qndOYwOs1y6LCwD+jndhK
	TksdUmDCKXfkGMfuRqkDjmAiegwME9gKVlQw/MDdTaPACdrD62oNvxNmbZTdFBtw9KPuEKfZjvT
	MwBWAhkHOScJ0Fld9CQCJG9FbSE4D7a9N7UA=
X-Received: by 2002:a05:6a21:1f81:b0:3d1:8876:fb1e with SMTP id adf61e73a8af0-3daecb1c625mr5367898637.0.1789109440980;
        Thu, 10 Sep 2026 23:50:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f81:b0:3d1:8876:fb1e with SMTP id adf61e73a8af0-3daecb1c625mr5367829637.0.1789109440431;
        Thu, 10 Sep 2026 23:50:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:09 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: kaanapali: Add t-power-on-us
 property for PCIe root port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-8-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=822;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=54AH0wpcG9YpaT0g+nIZHW5mTY7n0dyJOnTEuoBzZsc=;
 b=qDSjsEdHpTfGxtuogt9jV6+RP+yCcb7lMWPeldQM0K/9pIz6VebA2GJwDl96hTcq3lOD7cNa2
 li9LqTd40rJB1YTzfWxGbzGZY+iZ0kzHi+3bnvh6ERWnwp6AD9InFuX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX+NgLSxBccco0
 Tzsio65T9Abmv5322SQwTh7YZdVcj8qug93phuN/KfmALU+qJjOkHwlJeqbxgfrKhENBRJHQsik
 hc1oxsotOk9V7WCY2IErhG/VeWaJT4uWaQjDoZag+yCDcYyNE8/c8Z6zdgUCPvMWfoZHJa/Bkir
 OGbrkQyWd9EXME0tDDLOL9TtblYJbqbQ42qgvVkzMvqHglXnc4f31rvyCeU2cLnIow7pDJfoigw
 X7N1KqWLwM2jh8FhZtCn0P7r2K7Od+V+O9/LfGiX/bQoCp7zihx39RVxj0+i/TDKr7Z530qpNaL
 BVcMgAma2daUvd7o0oSU1O2c6reoe+2aeM2astpbEaJxkc6IsE6zJ3CSN4aTyQRSuSSDMyEEsjy
 BegkRY8tYSi6NwVElzby+Cx2h76ByY3AF3YwKiId/W8657YShtUUy7Y8TIHqy9YnfFWFTS3PIbu
 aEyXcK9r74xBg10oKRA==
X-Proofpoint-GUID: y43w3hQFoJBHUSnjn22srD8eaN6MVxuD
X-Proofpoint-ORIG-GUID: y43w3hQFoJBHUSnjn22srD8eaN6MVxuD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXzr7PfWsZvwzd
 mp0tqwwwAozpyK+fx7brAAsA9rtJhbiNymHbXfEHKwIe7vBlmXj6xPEG66sFdp3vP92Lc03ec9+
 wG3c/9ul9rKc9/CHQ6f2r5rxPf16XPM=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3a4c1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root port so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..1a47fafe7265 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2456,6 +2456,8 @@ pcie_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1


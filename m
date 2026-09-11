Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A0B44838A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109437; cv=none; b=Dy9FQLo3XB32ujnUEfaN+lAbW/F/4jP6+2jGlIgjYQq0xF+BwHLUrMeQ3TZ/wwcDnWcTvyDmKgIUAajoDkxkDMunDP/IPLXNb3LqTOpjWzWoiT4NJoPmT0YD7PG/rSmNFKjAfDHiThgd5KPeGXr3b8WZG1DBujbLRzHYRRZsu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109437; c=relaxed/simple;
	bh=ZwoMA8Ox6Voxca4W7TxJCuuQ62Fybafvlxh9RQQvVc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYNNQB+J+gqOxjDqbV0eRFKIoD2iiWFGpC06qcvpowuTb70X22s/1NjCWI6dbZL/Va5KCqnF93C9i//ZSMP0HjJa5pfIFmKMBjbIZib0oEXEgSXY8NblsLs1MSEWzJGrQTgrpT7lvm9VeL51N2/bwLmSMGOQtfV51jaotZNkhEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVjP7Eri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IatUjvOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVjP7Eri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IatUjvOX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kE8l3550986
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=; b=iVjP7Eri5rcITkXk
	QxxSYxhar/tyMUBg3H9jl3lhWoUq0sqtuR3SwgnxdJgVW1+cvKJ6nyceKxB/I/W+
	ak8e5MimNn+GF9dDCMfFavlPq8Ma7/e/BhqOll3KdY+Gbd/57EuJWz+gkMfnzB5O
	0vjvEslzFqq0BmLPim6ccy3cSeHRvLGPesAJEJViBj5Xzo+IoXo59sUJsP1qEErQ
	bE5LrY/zpIx3YhSASKVNw0Ez8AGlSgWHcv6aUA/cEcG6QsarMh2SzizVIRH2W7z9
	/HJlEzE1IxjbMib/hRQBY2DpRTKwvZ4uGZKK4/8Z57b2WvKXkTC7h7yooUUCyskr
	acR0Dg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0gan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so522381a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109426; x=1789714226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=;
        b=IatUjvOXAGtTgJB74K3//3AX/QdZysEXAygvQ7vu8pKaCaW50/QCY/vWoOuwYiWgnw
         BNB6nOy/fL3U7cMy6SyYh1nmd19iJYMzpLt/Z2wuRw0ZsWCs/pe0vpM5lSGdcLezESGE
         zAlEqbNGc/pi7tuhELBals6qDyhnqNuLbtETMCCHvpYMNO3cm3D/m/P+XkTFSbgVIyh1
         NIJsR0+XKdbvOHPAJ+co1AScyqjeCcsT6tcZR+OwcsXCFhCRz5cQN2CDViqd5u6Ite7p
         zSznupc1vfkQrFe3RQZiHjzqp3RbEeIR43uwLc2qt3y276JW4Y1ro4FX6jRL682VWy5c
         wKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109426; x=1789714226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=;
        b=BwbkEW9BmWkhqh1MQPwSn7T7Ed1Ttqog4y21rNhgHANVRl1W7MYOf0xcPf0Vmf+5uA
         Dwufx2/aB1qUMCR1hWB3yO1JQdcMGfehg6UxfiILdBhqaVp/4sEp/1d8NCaPtdtu+k6t
         A6u7sNq93/1QFgmLf1YRE3qI1cgWODOdZ/comLMnHxE3Xt3iDpAXyVIXX/PUkimTiR3Q
         SvkrMC9csoPZ96P2rs1rhX/LNCAEE4xGiMRtwXfwGuGrVvkPxrxgvtcKF+W5XZ9s0aVU
         /5ELy0Virwri1ntq3RZP65QLCg69tsgRcxwkC3YAXtHOo9jyAXwXErhooMtLuqRXkShZ
         EgdA==
X-Gm-Message-State: AFuF++kIBr6amT3bN/Pbm8PY3WRbemEgUSbKgVLh14+FWMIkeEfJwwLn
	33TZWlBRRwBhgUH2f6u6EitflVoq48ej7F6ypHIWULzSiBpRPtj3xUGQhyAN7UHO07tNPihJvjk
	xpiKGHOTznDvKh8FFwYKi9w8fC0yDwWf+7azIBZ45G0jIa2aYDaUqVlFXU7siSNQV5rNk
X-Gm-Gg: AYBFou3v4xqb09cbwL2tBAvjDaKP0u8mQMIOOvLkSC5n8Sf84u+Lhe3v0DChba0n9+N
	6uT2R7VbEo2cE5djhQs5FFxkMB73RKNHGGA+piDY5Mode95tzJfNRGeuhE8Xb+Nw6RM0dJaOvuW
	MbW3xRdhVTIgVxdMfc6NJC8IRtg4dlf2umfoFagmXJmc/mhtzMI7YrlvbDsKDVJ7eeooHdBmyZn
	JZShZmtqLTo0vE1bVwtb1aICIfvVHit2waj7adepav7Jza70Pu4jntP/7scG76FgDqWXhvV8DRR
	dThZZrZXm69w2iTPD3dDZ/jKi8iziQKWvfavaCWCols+wXQhtI6Yha30twM6S29/j32WDGzKYD1
	rcfK4A7HTDeSs3FLq74oDbh2msSw0A2hHTfA=
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr4510206637.2.1789109425695;
        Thu, 10 Sep 2026 23:50:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr4510155637.2.1789109425258;
        Thu, 10 Sep 2026 23:50:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:05 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: hamoa: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-4-c9eee197d082@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=1295;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ZwoMA8Ox6Voxca4W7TxJCuuQ62Fybafvlxh9RQQvVc4=;
 b=VeSKiwNYRtY2YbACkPlI4ykxtAOab10+9Np46hXK/j3rcKpDNEwaJfxvNDBAWBXs30lhjb9vt
 BeY9ih9GK+oB7s6k0I/MlFPgOQROZqJv3Zh2NaO/QFos/IkaLcqKqLQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: iSTZo-GEmKjFzP_jGJCRXv9s4cFdQp8V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXyjFbdRLwEll5
 8kVOJBP6TPT2xMJ8kjpj1fLRfjbweMD08MLTeB5Eet6gadmlDSh9xsATFCxQMP2aZttMGfc9YcZ
 mk+t5CgyejSQc79AIYCZK25k83aEPHo=
X-Proofpoint-GUID: iSTZo-GEmKjFzP_jGJCRXv9s4cFdQp8V
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3a4b2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX2eNO8QdG9Oom
 4nr6cvvcZZ8O3bNa/VKka0jNV49ZzVcyYPD7ZTXql6AkrCtm2mTKPB7j/CKo3uAyS2OuyXl0/I+
 ie6+5rC0Sms5pRGKSJU2TkfyeK7T0jS0cC605T61uFdHHzuve3cgCPdcKMEr6Y6m0GU2+Zsv29a
 ALNNP+z6+co48miKT5kGO/gWudowcVmEKuizD2fQyPACOB8FCn3I5BqMpCU/84/rdAb4lBS1iNL
 LpayttL+qYTA9vrzNVkcDtvVVpoW5SUFojQg5YUhqGVTnBKK1G56hRky160sc904SgiP3J/kKoK
 hpMe8X+4DAHNuUpkD6Dka3q8cuAY7u95hJsIGKm4Wvu0za+/9sLWKAHAzGOqc/vnWaLi/r53PfH
 Um9Fqmuq43X+vypIbl6ZsiR2wf7ziPQ+FYR6WUn3sui67QLYGNPgxwFvzZ85MPXJh8/K86NQ5hJ
 C5kqZukGFIlm2FaH7tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c..2fbcdd4e9088 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3374,6 +3374,8 @@ pcie3_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3514,6 +3516,8 @@ pcie6a_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3654,6 +3658,8 @@ pcie5_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3793,6 +3799,8 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1


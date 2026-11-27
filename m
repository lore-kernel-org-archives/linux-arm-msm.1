Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779873;
	b=2lCoBlNrLZXe3t4jvelIpshZiDmkn96JD8RyDqlIoIif+fOSi6MEbJ9Hn5q7vu3wOdd9
	 RWJlMb4pKH3LmsmPXe3KiNe7Yr8IO9djpX6iKi9wMOV/hnOAA6nNmTk3vX6WvbQSeR4EP
	 uzXy0JDfSxX2NAiyDFjdALIxu9o75kdcd9bN6W1Z4uG/fjW8sHo2ckTBRnIDrww82YfCX
	 WTEpdTrgCg0ScPGUQs0CoakDI6MMrCbgno4Zdpz5XcS9QaB/CmBJ+JjnRu9xSiKaNHhWA
	 XLh6Xku1c6IUshQ0oITZuVB3kkKO2lamkgyJBex/3cWUyQNNRt0AsSv7yN35RsLLjEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FEX6OHmXYNA3Xbk1r0bkAKzjv/2jynYmSmXZuZBaYX4=;
	b=H2s35lJ4AHn4AYPqe7Yi2zatShaNABxeIWBeSmj45NWx+rSFXFxjykpiqA4V3hotfG65
	 0cLyVmlc9UqPk9BDsJEIk+VtfupZZERwUWGrxAqbxHkeqxWqK+iAeu2Hx1bLjZ29yoS6a
	 tlxMJrYFKWG8j6LGEOgqQPCkWOAuu4h4Fm9LuAH4SygthQoX9WW8xrAUh7AOQbtDb3OFf
	 u9dsbm8w43UqUxqBcH7SvJAc02jUyGbA75IupcfLGPAwS6NsxthXe/5xHc8mRmE+pn63s
	 2FoJrqGMae3KA402ULjrRLBtjCv7AI7/EQaucAAq93kUUlttNsINqXlCKXVStlqGx3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Enb8SmqC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CaRzkw+7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C3606A33D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A8C3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Enb8SmqC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CaRzkw+7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApZm62058138
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FEX6OHmXYNA3Xbk1r0bkAK
	zjv/2jynYmSmXZuZBaYX4=; b=Enb8SmqC6MpVINMF1WBOevqxa+zMuk47FbNFjF
	/YJO8H9kmQMwPSbW6/+JnFGO4JN6Tr0mTN9z2tHY4TnUrSlY2qp2agdq+H7v1DQF
	YHGCtJZ8FoPNFnT84sFt6oo6Ws7bjfp/wAdS0CnTzejFJDt9dJr/9jfTetulzdxo
	Zb6O0uD9JgghITmQg8qrra8wz3iK4xG/h+EoU8PnaQgF8osgozM/KpglYj9RZnV+
	ym1s68Jc/S6daCRyOrOhbUkreHeGFhq1yt1vXTverLWuyWQKG4IRPQapMxptbMzE
	7x3Cviu/LNTfQbddAlSR1+dnYK2qTMVAwq++VTp28XRZim7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gas98c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1450186985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779871; x=1796384671; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FEX6OHmXYNA3Xbk1r0bkAKzjv/2jynYmSmXZuZBaYX4=;
        b=CaRzkw+7990+5aNCUxtddp2eWW0eMKbXQEFt12fGvyJVIlwGYCJAeiR689sq0T6tcg
         cKAd+u03GfN0bpLZUbEHsHMrMot3bzH4bLkvpyTnH3X2se857SbmMJ3nz8wyPpcAJ4az
         gdjmmDqv0g/bTtK7CuDq+yDEE5GUvrsDSSLTt5UHfxD8NgiPF0ku2CaCDtDffTpWc010
         FqMsqWf6SplcSxKeqfv72lkMSWZ7WrcBko6J2pvy3SI1SF4WwXRZlVKPgRoO2GToZfwD
         oBcZ6Rg9Rd2GglHRyZkWy4Z5MBA4WiylxxxzCR3Zc1Tnag/ZmgS75IYoDZPagLKWT4rN
         Vdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779871; x=1796384671;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FEX6OHmXYNA3Xbk1r0bkAKzjv/2jynYmSmXZuZBaYX4=;
        b=fxM6vE4xLPWg801F3Kh2Y2MZNNfXb9hPV3dHytkrTsItmwYKKwAOKoc8EYUceoKnn9
         6trhK8FWxwJ6uSuekG96ZFm2TYHDzF9DTaEnP2gasJ3UGj4Vrv6XWr8LVrsgYCxzqqgE
         o0UmuvbdtkNNsSyJxmJfolsLKs7xrhKM6ZOZ+i6btxhe329jcB+RHaZM7dp9ntxbJ/00
         9Gk7BJKQTKBP0E1aQK+zZjG9AbXYN5cgo3glWbsbtWCtuIG8xvoiRNGWDiJArvz50nWZ
         HgJZdXd5bJ4DSAw6WizOvYSnOwSs84qGTHWp0bx76LDYZR1zNxbDYy53sfXlrzdJ5lgc
         bItw==
X-Gm-Message-State: APuU4Z9pmZayXT0jraJ/BAqIdQoJFjRmDqeB6DE5GeB+4zpEvkYs7z+S
	aHRqRnweaQhuCKm9ulzpgMZOrNhRU0Emq0fFpJUT1KCgSmngNfqUahYOyvX4KawxtvOcdaN3w2R
	6OCJyNrDPLifK6z4Mk3zXTBiHE5PvyW5ISaGJejdk/WDLwiqXtH3nozOg16Byw4SqWs3e3Ijxwa
	jW
X-Gm-Gg: AZFdTZf17b0XO/B2hYhnt/DaL+xmxU5nAIwHHwj2FQwodUt7SK5tE82xqqA5aPR61kT
	KEQWzETTvzGpPrHJYdk4bgkwiZfEXKIRqWiS12pE5UTVO3e1lXklvZLhS13uE6LNoxHGPS8FZYG
	siPmYh56GOE7ydPt48838A1daSuI5dOsY0M+D+J+HXFY3CnU0iJD+afE9YARzFdq44SqwKspsOr
	0vWoeo/WHLipHn5UBHmOUL6+xjIFTENEtUWcS9a7TiKKwrQz8uL3ESc1wm21mDeh+BSQ490hhVT
	0TYtXLDdZsxMMhtorV35QKVJ1xgOvRTK3e/I1xyFeYngJfpjnAeAVZrBssVUxob6fptBA1jhNeY
	mpUDg5vOhvvac/CXpiPMalexWpYmjeLeaqmYtpRgpnAFjKB8BEvqfFBtCCKkMy4aa81girjfZq9
	DThqRcfRzbw7itNip81ksznBMKs5Xe4DoTYrbtPv4IVyHDl+z5nO04l9PhpZLXREk=
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4101366985a.58.1795779871457;
        Fri, 27 Nov 2026 03:44:31 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4101360685a.58.1795779870764;
        Fri, 27 Nov 2026 03:44:30 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm46715864f8f.51.2026.11.27.03.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:44:25 +0100
Subject: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document the
 QMP UFS PHY for Seca
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
Message-Id: <20261127-seca-ufs-phy-v1-1-75379cbdc641@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABhtCWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNz3eLU5ETd0rRi3YKMSl0TSyNLUxPDxGQLUwMloJaCotS0zAqwcdG
 xtbUAK1s+FV4AAAA=
X-Change-ID: 20261127-seca-ufs-phy-4929541ac850
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XpXjuNt2nvdXv/PWfTHtjIJh5suL5Fie/ejPzYjt/Kw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCW0dTfqbz3v+boJ+ccBCthzrEU+6AE+JCgjhH
 /hJLCe2NWmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawltHQAKCRAFnS7L/zaE
 wzwlD/9QMgX6B9Rg3L5cY4gCPNXbRy5GbjiuJg8fh+v3si44+KteXgX0/pTSznn5OcbdatXsY5e
 9hYYtIae+LdxRFMU/BzpGMSvVKrrCeG4qgwciid4AtRko368hlQLJYSLJaP5GVJg34+mO2xsfBc
 D6o6MmfHPSnITwnE131q38+v6IB8AOPDG5By21jYb9PfEhmiNhSU9EVdkqoP39Avc+7Ysz0PyAG
 rSv3Y5p7adC3S2Om88HQLfG4yUV4xirzgpkT4s3Z4pU9xgUQQzqgby2huPi9OfLWJwNE6ZcbGS0
 eh9eMJC2IXh4WgSCWo6KyKiZUOxoK1WW5f/dXX7aegweCKp2SKk1LT5jkh9JQBb6wAXYb8ALoky
 Gi4MWzRqfzaYRDTf8Day/8AOBnNt/SCX+s6uMh6Xaq5CV/xgI0lnSFc+PyenjdCNO3INgtJRrKK
 U711hzu1/3hkn06TEChzSjle5YSOj1m5aRwCHQT9maqfNI1ep6AMyfvKc2juxK20m7L5gvCNcQw
 mCq2ShCtQvSvri5eDOy5E5s4f1gQI1FiKKipPUfjY4bA9ma+Kx50VUShS2fBuGgLbpco+rx7GfT
 J79Gad2uYjvONzuk66ILXTDTJ+wSWdAv99BRBb1tajrYqAgIC0COp99S6SSXRfam4B7/9qtXuLO
 2zg3whsxFCwP0wg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: k3Ll9WeZHqlfboPTBdk5TZL5MvD59tvh
X-Proofpoint-GUID: k3Ll9WeZHqlfboPTBdk5TZL5MvD59tvh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX4OdNv8KEpU1M
 ap3Ik8FUGWJ3ROAjbOUoG42HHsgii+XXb7fEP+WB8T7wtHi1HbaQiQLjB3wqbwmkUM0wVl68hBw
 A7mgVx0wPjuC1hGri84TOPUdfaLU68Ck88tMU89Kvxdt4Fl5M6GmDAGhNkfEOrR1KRLTub0oDJm
 Ch9d9Ysmsdh8vhLy5Dzh7LMlIjPT2KNplGq2Mr0PZcWUN2c9Wn6gGT1ErBiuN+4gRophB331KT+
 K9sODmhvQCtjik3GqTVDxCbb8ryfuj/XSNx7e8Jk/wnOJGz2yp5oQGtUVgrEuBYGuZnYT7pPztY
 SPd2B5j3x9dNXGc/pvTIhMB+Q/C2vaeaaMbs3LV+ckC4eddHURiTS4R9JOLN0zj58EcM09qIx30
 xlm9pzurRER6PPfcIjQc7/47q2il/BPqQVHoRnsmrr9bjFp9lismINvQwdxRI5fo+UAV0eThL68
 oA73Vfr04rPPCK1AM7w==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b096d20 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5OrrVIwHFqFdhR60284A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX4p9XepGyLOba
 kpvgScaVLSwm61ZpR3ChtPhdVdtGmUss50RQxhjCM3dHoHUZWL9lemv72jskN54S1Jxoh731tQP
 gW6cH91V+eMhEJqXDdstbpfAS78HGmY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Document the QMP UFS PHY for Seca SoC. This is the same IP as Nord.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b523080e1043ed670edf5ac7080f306cd..08b0fd3f876f40101ae2bc0939d5f8861f489fa9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - qcom,eliza-qmp-ufs-phy
               - qcom,nord-qmp-ufs-phy
+              - qcom,seca-qmp-ufs-phy
           - const: qcom,sm8650-qmp-ufs-phy
       - items:
           - enum:

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-seca-ufs-phy-4929541ac850

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517726;
	b=oGQhurImKGj4lS9opjoQqMhNx+GfBixIbfn3mlXFqOd9qhU2gLA/Qc6Ab42Y8pWkXFEw
	 9dXy6mGKQXZ1zPbG9spT9Lbi8bIW/1lk1etqWaG29fSYJpPxG13i+ICeFSEg66ubLclXM
	 o1XO8ZFHCKZdcNXqw2cqAYgW5Xs9bCKQKY+R9LSWNmRZqkLlxce5K4IQ3bw3eMG+b0s6D
	 vXvnUMIrmfs7V1/Ryh2GK9yRF0j4fJJCkWiXysBBA+7qHU2cGi7VH7BeBOCMs9AmwpVPQ
	 /7m/S+giJSU+gzGFn/42IHHJdWEsM/iyd1OAVGIzzkP27DnCcopiE8dniHsoSNn6NCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
	b=kD0dDJ99fTRk0UHKQkL9tCw61kEbFmQad/n4YNyC9Fk/eptEtCkfl+pr1VXv96Mm7BFn
	 InpALlQpk9oMmph8rK5kvpcJ1on+xU3rJDUnXALH3bP5uqU+p8j9c0Lq6BEx5BT+oWM1c
	 bJPyAS/Or0z2Je+LKNBP4ti3ztiGSSHdNdqzTwYxeBNXibi3l0bOci1XQI+yLwhSAvaQO
	 nP7RLuz3pnBFPcYAh/BRuckf1MxGYWvpkMlxFV7trZYoxmj9dvg8+u6SbX+pMuoN6sBDI
	 AaZt+0q3MnAQuMvgay5JD/sCW1d7g6J//h30kDckfGlNwctiBIyAtTbb8QXE2J0aLQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CroK9pDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O8svVxjy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716C8606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CroK9pDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O8svVxjy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ZGGf3851165
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N0eRXtNM8GK
	uA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=; b=CroK9pDcO8dt14BJKKlzJ0ZnHzc
	s+9BoOdw9hKJJWfeqR6pbkrX8SJ4xve3wLDzhDXNpO5u0+FN80yHc6stMLmLaV47
	cIlE4AdBWmp9EHIqpt230iw9Nq+8VWtkbDmEjx8Ujqusi8cwWg59rqrmomJ41vBI
	aXempHHldje5r6r7MepoifCGHyIb6G0g7H55eXbMZ4ee2mfK6xxhC6tODOdLN73Y
	1Uiegty1CgGZt/Fu5NmWNnHS/XImYz0biKcZWHHif7l1lSbG/K4neWHJTkk5o/rY
	Yc9OdP0IbydQCHEK3cdKunzJCfBQWNcieEZKcT7vnrKrzTe8eMrjArZDxvA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb2b77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6197073eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517724; x=1796122524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
        b=O8svVxjyb52ZaKM0NLZReXUFdUVUrZovTMz7bcN0JW3cESkeXs6wre5piyWlFKEh/A
         5LX3jcdJnP9l5jwPGBwsup9NWdBJCP9WT/DRGrSfGMNcnxb4UroL3VKPcf5uVClsuVBC
         Q9xnpejdJk3+y3tdKBU+GO5HJW3BlS8Ue5s0lurzNS2EWlE3mBLKOBRMRIEmtenUH1g4
         vR7Jel95DU+PSVVyJrKNnbMquMZJQnpU1gxALbXSR3tiMUY3RSH49mpRDM54NOayVIe/
         7wz58bl+t8FFUEFKYTVWwJXVRmjHY4HEivd6McPY9T4rcb2yPOEPZiaqko3BNd1O3UL5
         jwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517724; x=1796122524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
        b=P0DV/D/PXXh+Rz39oQwaU3kfbnwIy2bp4q2W51PIdD9mbm+WY1LZuNcU2Z/bSFL/B3
         S8CTNqUvQ/CjKmVSAARZac9GY9Noa2sFmDrEpg0KZIXeLcitHYMeQUc7QM2b5FoZgjT6
         S2IKah3VbgClr06CsNQKZycNaJnahvK0ykvZvedyU+EDL/E4t8W0PtLyQNI0nn0JLlg3
         ln7FnXO/MZGza7+vA8jpGY/OzSy8yFQezGp3dkfBdl981CNVV6d+2W5hAupSLOaEMrm3
         lpMD3NdUB3PHEDM2z1asOsZ069/asicJrRiMf5nTJNVAzOHS18Oh583bQhz0dPVR3jaB
         TV7w==
X-Gm-Message-State: APuU4Z+6D5asM75dEvFivBg7NR3Bly9PKLGzGC+qwi6gfcgTcnvFyh2b
	Tm61vECjZ+0rfG3sEnvAIDewSp3M31CspxVCF5STKAcAoV1oDhxHle2Qp6aOB0P1ecFd/0YBOv4
	g9fU9UEj1+7cuoTy6dk0wCaqxOElrEpjsb0KtvyDDe6nnqOWkYwNHmmwlbatJ16VErl9u
X-Gm-Gg: AZFdTZe8e6Z4q7bRSS4fBfl4Sb7p6ftOac15RvpHgs/ZsQWGz+/loQXoDzHNp3PTToQ
	I8otv3IU02/CxzfHhOazMMw8DDpijltO2XjbegbmFmLKvG4ZP95gUo4a6+ydxk0MMLonb85G6jB
	lhi89Mo1Cx+2/TziqHSUWMb64o2OP2zObWyqgiMZY5aqvIuYoburTzp+fXaglu4wpzRloYaHqOn
	MCcmcnjJCGUD+lK8P4DZk01tsJjTS6GPg6Hv02Zm1wOxsKbt4DUtF9l2RoZcNcFJaCYAz72f/uk
	mrF8yZOtOhZgPxtMQMvHUT6nvcTb9QJ1w5PHR4L5yCn0CbJoXUTnm454miUr1ndruVN+T6iPNuK
	y8wO0njN++xiPeOoWAz0QBV4n0mYbODK2cnsvhOl08EJ9Gc1pGpj9DFB4oNz5sIdP/j82O1uPzQ
	6DUgtX1mDMNUfRt4LZYhPZ/Fhp/YUcb09Yv3wlpzNzZ0oUvcfC5XokQyVg
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr13709686c88.22.1795517724481;
        Tue, 24 Nov 2026 02:55:24 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr13709670c88.22.1795517724031;
        Tue, 24 Nov 2026 02:55:24 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm22616418c88.4.2026.11.24.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:23 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Seca Ride board
Date: Tue, 24 Nov 2026 16:25:09 +0530
Message-ID: <845a24c91ea424ff30faa8e1d357c326eda2e5ba.1795517711.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b056d1d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ZyRZhyG5ClUV-WacA0AA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: LA97Dv85as-LCoKafQM5WWZ8OnB7ucvA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXx8v4bHmI8gRm
 ft6mowoqzLWbnO1oNIorrSK+tso47VJdVtjn4YJv2zzBp4JwBC18AYx7/66OlO7LASTMsFn5T7t
 BxLVYNGRffeoa4TeidX8LgLk1XjlZ0c=
X-Proofpoint-GUID: LA97Dv85as-LCoKafQM5WWZ8OnB7ucvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX4pGhJGGhd9Mj
 zgr3QPfLhnogH732KidEBWpZYa+1R9ujDj0Z7M3uYzpcMUCdRhp+LfC2ZdOvMuSaK5YI4R+2Iws
 ANyG5ZahuMxHSd3/TLvetW5VEhGFXnOTp6F7R8AA96WwpelSWdx507fQ1MJ3vht0u1tfPhktkbu
 j7U/BEC1Sf9SaNF1M9bRVHNgpG0BgjwrwhQiiPe7gXY8wem3pJNiOfsHs5Qt78nHvaaiBVIYt99
 vVVfpsYgZsM7YT0HPueEzeo5fH4JpKl9/PmHQNwP6R4EeTTvsE5pFoHF+fUOIYaLpkKaZyEjmnE
 VcnWcNczRiuYJHgj5G2WI2HkDURTl8OfjUBBbtue+4md2voKRUotPC1+eolS0L0j7SzbPonXGjE
 r9erTqKk8iOBdV8jj7N1vvAoF3oPoI9Sntx1qpP5a5vuM1SbhECXPIFSe5UcBpT/SLdsx6O6p8u
 IyhAn5Jiz8IyE6RNemw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Seca is a Qualcomm automotive SoC. Document the Seca Ride reference
board, which is built on the SecaAU GearVM variant of the SoC where
platform resources are managed by firmware through SCMI. The board
compatible therefore uses the "secaau" prefix, with "qcom,seca" as the
SoC fallback.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7157795870c..ba5dea9b0560 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1091,6 +1091,11 @@ properties:
               - qcom,sdx75-idp
           - const: qcom,sdx75
 
+      - items:
+          - enum:
+              - qcom,secaau-ride
+          - const: qcom,seca
+
       - items:
           - enum:
               - oneplus,billie2
-- 
2.43.0


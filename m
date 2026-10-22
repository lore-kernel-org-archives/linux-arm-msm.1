Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662603;
	b=IqO9X8VKsgJbooZcRkaDv3Df1EtNsFBtBYkbVzBnzKWbtE3fG+m3NTWN+dvIcFceGjh0
	 T1fwXcN2utIQr2XHni86BuhCwkM3dREnwSPTZHZF2EbmmE64UrrpFiZhnPg8C3s62InHb
	 06schHDDWLPMFfDccq6krsVw4cpIprIQY6LymS5hT/zyPp1T3g//TNxLEXGCq1lLAttC4
	 Ul4S5Ub278fpYaNrtOGV/EqKPa2V6cfOfq41isJCldbHKw0y0J3sss4Zx36aKb3/6c/VL
	 pxVz8o6GNHQv4wuLNIMOW7j4mhzsq7VFbKh3qCBvb3CAH/CROeST21qI0YUH1xFsTGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2QkaBLLPRsYQoGth7j16Gi+5UCkKaxN5I/4+4Qhdpdo=;
	b=PoS3aJZWuMUwug5bXcdgLg4CjxM8gCeT3kvz88qJaOw/GsX1bpcwL34AIkbg1KWJSspw
	 lBPq5I1aRsi6nmLecwxMGxMWHULIFXEbOZqzobSOcfumw3pnvzphg7BjQFIi53/CQBbgS
	 3z5jrZykIObiM3/9eo+MOeaVerKn+E/vF8/bozYbO8tu39uUZBEdNPWb3Ei3SClqkHRF0
	 VvzL4oE9DTfx/eyK7DEMLeBxPaPepTfd7Z+BxfbBC4BkwbpF8cQZq6hn8ixhR4m9trvNd
	 /FaAJw6oh6fx/xIkEZwkuNNl3Ea2W5y4/O7KNa4YaDv6ilTqRfaHkR0EH3/yFxk0CHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgzRx0am;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Km0CpDfD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B30C606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B30C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgzRx0am;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Km0CpDfD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LoSN3194761
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2QkaBLLPRsYQoGth7j16Gi
	+5UCkKaxN5I/4+4Qhdpdo=; b=NgzRx0amTvoeC83cyCtRJDW3g5smBPsEETMB8j
	nyaNdao93xa5+c0DXq7gMrIBqD8HW561AM2eUEPrq9EfvQqqxz4mghw8x+NfwjBJ
	W3jBYoIgCnvjg9/VIEpiBb882SRzIuswfq+uHKoFSqWTdMYasEjeS06SVmd37gqX
	JchlJWwB+6JzUXMLigXPlCUtIMYqTHJYi9AFyO4gpeJGTmmNDeGbLalU3L0RzPaK
	745xjZNE9m75aQAqNjE9D4Y1+xqmVFO1D2VZ0H/2+wguDw8iY8yrZlA1A62UMqHe
	jPdaKnHfMfcZQCes/OXqZuxRGNJem6RSPm1M4RHwoNhxEo5Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0d7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so3013882eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662601; x=1793267401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2QkaBLLPRsYQoGth7j16Gi+5UCkKaxN5I/4+4Qhdpdo=;
        b=Km0CpDfDFs0t0CoAO3oNOV3UbCl+aO8Y5OYUGjnVwtBwunIrqWXtsxaWx2+S2lHDBO
         j1cHDQsYSS0VSHX7TpeKy35qxOuxOI6s5AALvac5WWYdl/iF+c7w5bUdD5OtOCj0NSlX
         sWWleIUMhUtmaD3of4gycEuOL+LGnVTmjEKZ9xt817smi+7sxok+9L/Os0zWws9PbeCq
         2k1dqFlQm40IUkwBr/oOqfDJoXSg28X6chG+ZnUUvEIoKKJJCxLksSLZd2Xphyw0Nwlo
         RJBEwEFFbcXPW9QQqvbcw0OxKf2t0HtBzy00hL4hVK+X5c62CMkunN+yGFj4xqmtObyl
         RvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662601; x=1793267401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2QkaBLLPRsYQoGth7j16Gi+5UCkKaxN5I/4+4Qhdpdo=;
        b=FkRS4oVeCDhDr54YOqVqiH4f3z8Fwhm9hIXV/h8IH0OtK0h8ygLpa6SYKRI8JCJvxU
         ZdPJDy4FrhVkfpL2DomhB+fzWkgyYvP1BW+DVfdxgQKfTqWjTjAsxRRmvaAofykBjyPf
         cXIj92XV9kct8v7IYGvYbgMV6Qljk142apffXHem1MWD/UsJkwLssPJfEmYWC79CDFqM
         LebuqfNj72ESG5Hje3nBrfVbcNUEkzQz0oIl1cxJrmQqA7oDdIolJ1ee+wcCNnA7PCfk
         PN6CniLMl4OoHeVs9mKjVpj/ritfZh27juIwjpD+hhbALShl0O887452XEs+iKUAEBpb
         m7Pg==
X-Gm-Message-State: AFq9FYLTDmY7rn/52+yv8PXAVxbcwn8Sv8HQ5BuOgfsDGk0r+eYgMSks
	CXqw66xd6kKk5F/HlmYKyZQpcs5d+ikfbO65uDDVabUdXmaO/DgIxp1c2bY3P2QVO6nI4ZLoIT8
	Xfcm0bcv2DA6/WlwDjS0FfgqhPhyjnn3qPNJoNVh76usjczKpJkGK/HyvKbX8nEhLWno0fet7ym
	NZ
X-Gm-Gg: AYBFou2SAwloJmbyodgGvMFNq4UXl55zdkoJfBl88oMawSZfsJPwv8ABACdXt4959/s
	Bwq0s+jKoxqshBpOOSTrclMTXqVvsjJeusS8N//9sg5wmFMJtK1Oh5VcglXXYpfMQhzo5T/f+zg
	UqwwkJjJCaGGbMX1uzxKcxHDbWvHPdc7/pUW8M/69UL2RajQmZ6iCHTTuivOyY3dFzSpkq9KNAp
	Pm9sYh+FgipIZF60LJ8ly4JVnHB6rs7jHhS+bN7DvlmLJ4AN3XGwkBTqpY6Bed6DeSPKJdkMXtx
	BYXZt76POHRON4CVTeZwqVG1Pz0Qw/16LDQoajdxobXpEX/KN9ThvjWk9DCk1/G17NAQL41nInD
	UYGaq8H6jcd+y+/U19UplyA80mwQw0vcqF6w=
X-Received: by 2002:a05:7301:7308:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-3674d447cadmr5794731eec.26.1792662600782;
        Thu, 22 Oct 2026 02:50:00 -0700 (PDT)
X-Received: by 2002:a05:7301:7308:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-3674d447cadmr5794697eec.26.1792662600223;
        Thu, 22 Oct 2026 02:50:00 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:49:59 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: kaanapali: Enable DisplayPort
Date: Thu, 22 Oct 2026 15:19:41 +0530
Message-Id: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADXc2WoC/3XNyw6CMBAF0F8hXVvSUqngyv8wxgx9SJWXLTQaw
 r/b4sYY3Uxykzvnzsgpa5RD+2RGVnnjTN+FwDYJEjV0F4WNDBllJOOUkBzfADoYoDFnOWDNJS9
 YuWNUVyi8DFZp81i54+md3VRdlRijERu1cWNvn+uep7H3h/YUE8w1KBAMuMzLQ+9cep+gEX3bp
 uGguOCzD4N+G1kwBM1FVTBZ0i35YSzL8gJXwsfIBQEAAA==
X-Change-ID: 20261005-kaanapali_dp-f6d6839731fb
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=3513;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=Ebf9YUT2+AQzu0QYDkw4+3IQKi3e5KD+tNJ6G8A+yUk=;
 b=a66fQygAG0DL36lsBctdeB0Ui8HZn5GN3FSxd6e/yNwTH91siuJTIRbIkqJmYkvIkEqH8ESKB
 C8wj+nmy6CJAk1jGrGuas4HnLav14PfNFYIoZhbwmfQmrOVSmrRIZgX
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-GUID: vEOnHduICQv3CBHpKRUrS3jqH0IjFkyM
X-Proofpoint-ORIG-GUID: vEOnHduICQv3CBHpKRUrS3jqH0IjFkyM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX8ooxOxlHOoBh
 VG3ECPRK4SU+MTDUW55HVzYYZI6eDeW5RfIec+E0jSVeI9RXYwGGR/wYvjXGHQPrOB8kHAhNlRL
 mBgjkACvP+EV+Yo73eGQ/1xKdInBv7k=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9dc49 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=12Bw4pmKq0hGIMEmf4YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfXzZWCl+pE1KAV
 qYyesew53UEZwNAXWmBFu8EsnILTvzYLh7O7IWMp5+i8JYDTnkbyz+tDCeZwW8qkFm33Gclq8Ay
 zZGxauGURW1iM3EQZXqQ669b0tNxcmfr8ts/W9ufjKFxPfbEz2NHL4ImE1b3WHVh5ehxaHjGtUq
 LRil0kvRS2oqi75Z1YqDgSXhVBk4/H80ygACtfGsk1fKcTf0ULP1PyNhbJzd/r6iKuVhyqRjBqL
 dLSLcrmPVOOZrIDH3ykyJUWhg06WdqRQzxu//KOF59suZZNO+LqS8KXPHyt3hn8qRwX2eK+RqgT
 mtyWoB9QxKT5d8560q9rISX+tQqHl56ulW2C8ARbkv+GsJzpi0vErZyEXVzJrKMKEPipUZf+P87
 RzmjnlRZmlSF4s1g2GQvh0wrj65dggssH328DYDVKe1oPjGsagY0FMyyn1DN+oSdukk5FHmTntP
 Hw+BXzS55utUnsO2XNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220038

This series adds DisplayPort support for the Qualcomm Kaanapali SoC
and enables it on the MTP board.

Kaanapali has a single DisplayPort controller based on the SM8750
generation DP block, routed through the combo USB/DP QMP PHY. The
series:

 - Documents the new "qcom,kaanapali-dp" compatible in the DP controller
   and Kaanapali MDSS bindings.
 - Adds the Kaanapali descriptor to the DP driver.
 - Describes the DisplayPort controller node in kaanapali.dtsi, including
   its OPP table, clocks, and power domain, and wires it to the DPU and
   the USB/DP QMP PHY.
 - Enables USB-C audio support on the MTP board (WCD939x USBSS Type-C mux)
   as a prerequisite for exercising DP alt mode over the same Type-C port.
 - Enables the DisplayPort controller on MTP and advertises the supported
   link frequencies for DisplayPort over USB-C.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
Changes in v3:
- Merged the Kaanapali DP resource-count constraints into the existing
  2-stream MST conditional block in the DP controller binding instead of
  duplicating it (Sashiko AI).
- Added the missing additionalProperties on the displayport-controller
  pattern property in the Kaanapali MDSS binding (Sashiko AI).
- Fixed the Kaanapali DP node register block sizes to match the actual
  register ranges (Konrad).
- Removed a stray blank line between the DP node clocks and clock-names
  properties (Konrad).
- Reordered the MTP DP node overrides to keep &mdss_dp0 and
  &mdss_dp0_out alphabetically sorted among the other node references
  (Konrad).
- Link to v2: https://patch.msgid.link/20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com

Changes in v2:
- Updated the DP controller binding patch subject from "Add Kaanapali" to
  "Document Kaanapali" and rewrote its commit message to describe the
  standalone compatible and SoC-specific resource counts (Sashiko AI).
- Updated the Kaanapali DP node to use the MMCX power domain (Dmitry,
  Sashiko AI).
- Added the missing second DP stream support in the Kaanapali DP node
  (Dmitry).
- Expanded the Kaanapali DP node commit message to document USB/DP PHY
  mode switching for DisplayPort altmode (Dmitry).
- Extended the MTP USB headset and Type-C commit message to document the
  WCD9395 USBSS mux I2C bus frequency of 100 kHz (Dmitry, Konrad,
  Mukesh).
- Removed an unnecessary line break from the DP node clock parent list
  (Dmitry).
- Link to v1: https://patch.msgid.link/20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com

---
Balaji Kalkonda (5):
      dt-bindings: display/msm: dp-controller: Document Kaanapali
      drm/msm/dp: Add DisplayPort controller for Kaanapali
      arm64: dts: qcom: kaanapali: Add DisplayPort controller
      arm64: dts: qcom: kaanapali-mtp: Enable USB headset and Type-C accessory mode
      arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort over USB

 .../bindings/display/msm/dp-controller.yaml        |  2 +
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  7 ++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         | 61 +++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 90 +++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++
 5 files changed, 164 insertions(+), 2 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261005-kaanapali_dp-f6d6839731fb

Best regards,
--  
Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>


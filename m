Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD444781B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920676; cv=none; b=fmcFiSeSsx/bkoYNYEBl6EFJAXZ1B4IzKC01E6lL3+e8bjz/nsx3t5/UuOqfne8Mxmqmer2fEprU2P6K12/vXhBIanUJRcGnVT5iao3B9TiNuKSv6SrB7QD+oAh38/LJPDlfwX2Ce6R5nCp55pz6dMGl8NcdauidCr2mESbPxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920676; c=relaxed/simple;
	bh=Rjx3VSh+IlsFGXPOd4PqGFgEuLCZfA72s0nj72PPUOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q//K4NZq4oh7Oq95hW2imkPATlI0fTIAGZIWjUv1fYX6JiKiw0li1RQkysSclLEiusWTIB+fV+s4j9vwcfBHdcGh+L+7JNw+KE16I5/DnlMVVmnbQwUkvm8udvkZHt3Zfjh/cOx8zOW8TDpIrTmqhW4xNxoaFGokKWosgZlxKZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QohzRm/C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaU7BePq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QohzRm/C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaU7BePq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCbI0L1907430
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PIoVaCrEQeYK2SkD6sBo9V
	cjHFekMXJ6nFY5Daw1Wkk=; b=QohzRm/Ch8nwvVTlQ9b7Z5baih/L/hK3P/DpRu
	rZKID4IgLW7tTId0PIL3FudhYJvMQK1hORwApkhgMNucGkn9Guq065iNOk/n5kqa
	FOYlVsQwQLRfyQTF3B+X0t9QLMqCnjP24c3nF4tFEkCUUmxqTU9V9EDmxYwCEDJO
	DZDpTuKvVIrQgKvEIe2oAF08zNqdQRTft2jrcGFZ2N+hAuodheuXoyiVSUUAq3KQ
	kwEo8ri17eWr+2Mvn1hweOmf3VS0elYgh/aTwt9z05YEfjBdriPGk3RAQNhfrwNY
	BAt6kyl2m4Frl+j/XI51yLAhjpP2AAIVPYUr9lwgOsQj60rA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r02e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e934385db1so10993876d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920664; x=1788525464; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PIoVaCrEQeYK2SkD6sBo9VcjHFekMXJ6nFY5Daw1Wkk=;
        b=jaU7BePqR8KQkgBK4g6RyfGblM9TBrX5d3MMtaYbVtzfCSzNkbFksk0mBe6smwGXhW
         Oo8ZoHOrbkqzXopyLIchZTrhcTuTVKxK82yfncMLVtY6QdKKgzQptq603OPAYvvNC/ya
         1Hc8nDvent98CothD4GJFiWINt4wfOpHYl8EEG6LHOfR1ee2FyB9tuGGGhhofWJPar0E
         HGKJmHOQT7/wS64Ee2TYHJpmi3FToTwSqJT5mVDfLvXeDOjjmoi59UGw9iZ+8unb8nIf
         uJRW3PYlcX1rrWtgIRaAIIttl6EdsAkh1h1rpUAi6yTwFOb88PHFoazxPY27YQIud5jE
         2Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920664; x=1788525464;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PIoVaCrEQeYK2SkD6sBo9VcjHFekMXJ6nFY5Daw1Wkk=;
        b=eZVXAv9F+0O6LqaRzTOSUkUrSvXVpOlS20WZu8u5sbqhYaeaWfXw4gSnnYXjJjoTw9
         jxCaUEZ7khq9Wt+xIcMZVxOsNiR+MpcE+I7uHE9ORwrZVcqmvJrHZxtMJl7ko5JsQHwu
         6B/+VhPRDpUgPzJcZGW5Xm2H1AYN4HvogUYM306J4/CPvqiDc33TPQeEtBAvFF47r9sc
         Jnp62sUszSHk+NiVkLHB/y2Iuw9Nn5BMm6LOCkOtMPZLh6wccV/vDuaGMZiy9rGALxbv
         qtCwNuoMpxqt2Sn1ZB2iM6g/IHQwMlzYRPNycZXzzKVMa9MYrCoAQXl0my9IOc0TewqT
         5q7A==
X-Forwarded-Encrypted: i=1; AHgh+RpoHNuxSwgLiQXhHDkig/mBeanF9t9tyimQOCGgQS2iDfDLx+DA20+9nnXcNGX/dy8IP4k0C0myC5Vt2O9Z@vger.kernel.org
X-Gm-Message-State: AFuF++lc1UTh+YkAokXoja3Ob5hK9zeSxniCkUdHJOMe5RBrtBc4XUya
	xaypLspk8dwTaaAHGFO+isY8mrgxH9pd1TmrmxJjSJi/TfXq6YK2Op5xXtRlO++62dBPSdsoVju
	ItJe6c6+KRnOGCgCmTfuP0Hwx88g8VQSJ+/2PWjObWHzXvP08EX2R265TwP1z9FqMVMv8
X-Gm-Gg: AR+sD10r5C0av6/vAag2YPzm5lyMbga+2uY+Q54gRc8WFAOfxD/Bpev42GxqHDZRAzv
	CFBPqok3jEHfAbsM3QwkT3kNXCZRbUmG4uEr4pr4ACMUx9dYL4pBJITVw5jQMXXYM2OLkTR3kVG
	SnRqrJ3BJZiLy6tU/4S/ox9eRhzjN9PwRH7pBb9htW+6Bc35lmKV0owJfzaJMxG7xdQpm2Fp/zz
	DW4LubAM0/yGfzJV14ppvHE2qqbN3PCd/MA75W/7re/nMRsNF43ruGD250MzfHcMMJ61k0AoNaN
	O7bxUJHaIvbxeImmtNRhWXjiGnRQpxC50EJNzfXSwR8bhphVhxuirWV9J3cfTc6bOJIy+b1+t4V
	2O8vOHSA=
X-Received: by 2002:a05:622a:4d4f:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52fb94eae2fmr77319391cf.27.1787920663937;
        Fri, 28 Aug 2026 05:37:43 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4f:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52fb94eae2fmr77318401cf.27.1787920663189;
        Fri, 28 Aug 2026 05:37:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 00/11] arm64: dts: qcom: Disable Inline Crypto Engine by
 default accross all SoCs
Date: Fri, 28 Aug 2026 15:37:19 +0300
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP+AkWoC/yXN0QrCMAyF4VcZuTbQlU2nryJetEmmkblp04ky9
 u5Wvfzg8J8FTJKKwaFaIMlTTaexoN5UQJcwngWVi8E7v3Wd7zA2yNnwQdMNWS3EoUxIML6RpQ/
 zkLHhPbG4dhfaGkronqTX1+/kePrb5ngVyt8yrOsHzDEueYYAAAA=
X-Change-ID: 20260828-b4-dts-qcom-disable-ice-by-default-4d9cde057a51
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4977;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rjx3VSh+IlsFGXPOd4PqGFgEuLCZfA72s0nj72PPUOk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEBJetP6aN28ez1XNw8+P+KoPmG0mPx80SrQ
 0ijFAclBHqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBAQAKCRAbX0TJAJUV
 VnbMD/9+1B++b/1TqnoY4aQWd6FdbO2CpWKu/48FfrPtZlRyxrbN3HH5aPT756Q7flH9S7veiay
 IwifIeLoAkaSph3G7BLN1hIUu82dlQ+JGTHOaBy21jZdMsMoq4HgQy0XN+b75Tin9Zmy4xXsV8A
 8KaUnqW0KDGtYVq0oyV3lyWrOgBszlBV1VfQVDal8jj3eM+5YplasllQI2n/CW0hpeWKiR5yyMJ
 VSjwXes9217dGc2QqeteSK3/fr3yjafVoICHAV56mKIOP0tvNy58/gi6E6Yz1RfM1A6QebYYk2W
 K3eD4MJeOAp6hjhBD/gMAfivAXu45zKsUD2kNVBBh6aqLcXwEm6tFZkqO7NSnsr/kICSe57Xdfk
 LLkFve3Jc7/Z78xRLWe3GszOMyWmZH/i3KZFvWNwR5MCDBBmBtrSLoHo4x6Qd5APzzud+ftrRt8
 yikvlbdeAUqJrThVP3yZFApFs8wfw0m03bBl3A6DZppSqBdHMdGfuiuLLK6S38HNM7aaFocVaLp
 pJHP6MdvWiQuMcDCKKNMbSVCm8Uyjtolm5qxbTQDS81YqULI+veitIG0vcTU/bbUdpTF39DEmdB
 AJIN8Td6eUG58tfgQ2DIvt57rx/yvOqOjsTOT+0MaAvghfDz8ankQgWpxh8t2eRqg0BSwVTAYKO
 DdRLaFKsBfW9LZQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a918119 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JxKF5WyNfFDj0kmoagoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXz0Fo7PDhcNxf
 W65UkZir6RZ75nPRiI90T6yJ1YBqtpKUBt8FuUAum6Rxo11ehzVA1OgTImroSIF2iyTZy86NHTl
 B2pJuqFFFCc/djtxI+VRlaZXSDn1qQ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX0ory+0Pg74p0
 q/e3pWMnBchSoVlybl2fFY5UlnQcsjoTkRTs8OYYbiiue/GCPnxnGuSLM7/sZtQbx61JC3aSl/T
 C/Kv822MB/ZoJeqSchWomy6ya5NAoJ5+gTVf8oXqw9oCabLnL3CaFQoaILLR6QUKBrJ6SDg9/qQ
 7UgNFP72Z7cUvXguh60wJNdJSPi+tkhE6boj1UebLk+mqDEsAGpS4gtuU79BG5ZD/+Ss/CzXR5/
 pvRrhb1/d2f/WlwyS0ZmJxonpk+0/Nb3hPzkR3QOihfxcCi0Anb/y7UZBlPv82GWCOj2to+aFNc
 CO6OgP3irdzzp6ZstZPtYj9rqSC0ZUF6FIKTJGhCdMMFC7hHiA4a+ahxmw+jMYvMM+l4EGxO2ny
 B1j0zkmHrYEc1yl8ezSwResm/RnoV0Joxc4XzGSBgmN1uRVvINuTJEe/lPuyu7xXWtOhBtIR0Mc
 zmLC0ox9dHaGnXcAHJA==
X-Proofpoint-ORIG-GUID: BHAF0zuZmFAKZmh7f5Gnllngp12AajIK
X-Proofpoint-GUID: BHAF0zuZmFAKZmh7f5Gnllngp12AajIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC was attached to the Inline Crypto Engine and the driver
does not currently do runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

I'm working on getting runtime PM enabled in the ICE driver, but the
node should not be enabled on such boards anyways.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Do this accross the board, for all SoCs that have dedicated ICE DT node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (11):
      arm64: dts: qcom: sm8550: Disable Inline Crypto Engine by default
      arm64: dts: qcom: sm8450: Disable Inline Crypto Engine by default
      arm64: dts: qcom: sm8650: Disable Inline Crypto Engine by default
      arm64: dts: qcom: sm8750: Disable Inline Crypto Engine by default
      arm64: dts: qcom: eliza: Disable Inline Crypto Engine by default
      arm64: dts: qcom: kaanapali: Disable Inline Crypto Engine by default
      arm64: dts: qcom: lemans: Disable Inline Crypto Engine by default
      arm64: dts: qcom: milos: Disable Inline Crypto Engine by default
      arm64: dts: qcom: kodiak: Disable Inline Crypto Engine by default
      arm64: dts: qcom: monaco: Disable Inline Crypto Engine by default
      arm64: dts: qcom: sc7180: Disable Inline Crypto Engine by default

 arch/arm64/boot/dts/qcom/eliza-mtp.dts                        | 4 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi                           | 2 ++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts                    | 4 ++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts                    | 4 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                       | 2 ++
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi              | 4 ++++
 arch/arm64/boot/dts/qcom/lemans.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi                           | 2 ++
 arch/arm64/boot/dts/qcom/monaco-evk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                      | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                     | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                  | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts                  | 4 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                      | 4 ++++
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi            | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts             | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts               | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi                          | 2 ++
 46 files changed, 162 insertions(+)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260828-b4-dts-qcom-disable-ice-by-default-4d9cde057a51

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


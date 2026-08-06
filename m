Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404573D954F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004230; cv=none; b=dCoJK6GWACgkFdCvomRxbG77rPuPmTiY+BgeoQvyGOi0bQoyha8kS9XwfkZkcrwtFxlH3Y2da1rg68XKVqzFgupkopRXrndVowqXh5KVD0PPyYkUTFG7OUJzZlFI6Iu4JYQnqIdL5G9tEEUGik2EZbySlJir/E/nUtolgbhEXts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004230; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hmtsah2hRiNw3BKzyBHeHY+mISXYB+aDh9FG+D7KFxFXGjj9Rp3CXOALiMnDwtXmU8Rt4aiz/tE3j4RtPS1ICpNPK13htkiMCFlgE3ayS9kKdkGRpZciwsYAEom/GjEH/kqRezzo6uHMxE16qsKLdSZ8qEe6OnldPXS4mZavMw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Heqs84Zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vs4hAVwf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Heqs84Zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vs4hAVwf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wg2B775299
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 08:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=Heqs84ZxNTZOLVZ/7s1YL7I4ohU
	vrlJAoIb58bCdTdxKuHzgyBrC/wx43raXsori8DjVmBo0Aj8uB82Q4JOaI3NSRZM
	gD20XcebSEPyNqwJjaQnJ6D8xVJ3XUY9erV3C0LuzUg2O2tqEV/mGCs3m4lPuhQ3
	O7gb1azHJRryzajEfN+tovVrRJHcprolNfFnrEUJMG2gBCAIaqqdwkeyPN+jpLTX
	HhfhVIzGlKTZ654Azmi80HGrTL5u4B4TWPmB5eSuXmC4kHxDX8aLAGkLQENkSfy4
	btNpjiCJdXB8uImNY3aFJ7LMQzMHGT+jRlbG1QRHmIyTEq4FeJ+p0X5jnCA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8gycb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:17:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848d21bbb55so3417345b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 01:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786004227; x=1786609027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=Vs4hAVwfVmu5c8qTspV4g+N7qL7aIOhoSGKTKcKtdjQecOdNQlAeg+uwdcAeZJXT5e
         cjc0cbY86Ns+PLgUksyF78w0z9/EscBftUMiUkEwTt+hmxugio/NdyuYUkPIfeYCudC2
         /4hcpncexq4PoUeliYrem8jnZHButuwcP4uFoTUgpEXoajeqf9d8cG1eJjcBugPwXHQc
         RvmyBK+E/9jE1OL0+WmSA8c9OFUdHPS8Wtd+00InZpMfR/Jm8Hv0teo20uwxcPVyWMDL
         dXGDBnkAr/j3VIcZKvToDEaNPkkLKNqPN05WZTylY+OZg6xtESpM8OCbCi8VD7Dr0v0u
         loZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004227; x=1786609027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=AADjdZ68uSU6a7cnrQKs7XZlbJpZf+o1hUFAZMB2hzM2tUjdMRbbok4+M65dQgwznP
         6j1SzYGpSl6M6+IqvTNP3FkCRJnoXYT/kl3BBW3JvmLqHMkIuenifOpxawLUNU1rQ/hv
         n51xqe6gomKcgIPfoOZw0JXwXSJvenp/HkQ2aJHe5lYnp10c3PXQU/wfAEqoub18ZO6m
         hhzVnJkEV4nZH0hDOIpVOZuUBOdt63g3xbfK4j8qg1fyajASTULzFkHxxLnodAKzfdTn
         zRuE0Vj5i1CdxWEjCxIlNhllwzlwZFgPhzNshz8g9u+WSE0NmqjYJmRw7oMnChDVrxvb
         p1DA==
X-Forwarded-Encrypted: i=1; AHgh+RpNBWYtFC69ZaIqclTpcZIejtDA0mZMPvsGxxEAoMhklVAQWxMoeloeLBdw8EDnVPszK1wawR3dGbRj53my@vger.kernel.org
X-Gm-Message-State: AOJu0YxvyWVqlKm/LgT5cAplqJ/QlMB6IoLRL9vlg52Wdfxni4sbrPKK
	67okAj0lzXKdsP3NcmfmqbpPcGU+UEx5nKmfm3kpDeLcK01NVVxSEAazaX0cwP98kZow22RPs+3
	DpAyu85SpCMoEoGnutmExqo5AJH0+NWdN2/EtBSBqrbO1LU0DhrXau+yYtBqYs5wl1L1f
X-Gm-Gg: AR+sD12VWxXNRcczBR6iH4FyI3UJn+DphmSAPeOGdZsd+Bsqm6K7FY7xQDwjtcjUh90
	0CXEjNgdu7d77e+S3gILcna0Vk2IPUgVhWyye4D5+aE9JrO2Jc+Fo91YZGhOAjhIFPd8y+7KBGi
	zMJ7vHJEvrhlRF4mQlt7A4EInDYLuAPXmvZ7QR8BWMzeuQFJTrF/BoOQUofgqHoypq0qC+Iviod
	zJYe6u7wqskMufQYt7C2Bvl/bPI2CvfPBfM0WJS4WEuhAs6bXFfCLVMvkeHzqYphR10p7EcgygM
	KYBR17YVKmJh0AQ8K9PKIiubUFU1o76XV6zg7F/HvQuyjRCbab+ET98xVlvlerPPuH0IEbsQGZk
	KPyVLkm+/5UdqkvjY3MX5rxTF+9lLURpEAIYQqJZ3tRBzBoN4BtbQbkLdA7GM
X-Received: by 2002:a05:6a00:32c4:b0:84e:2f2e:8c4f with SMTP id d2e1a72fcca58-84f2dfcf800mr15130826b3a.10.1786004227213;
        Thu, 06 Aug 2026 01:17:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c4:b0:84e:2f2e:8c4f with SMTP id d2e1a72fcca58-84f2dfcf800mr15130780b3a.10.1786004226829;
        Thu, 06 Aug 2026 01:17:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538bc9bsm921225b3a.11.2026.08.06.01.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:17:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Thu,  6 Aug 2026 16:15:52 +0800
Message-ID: <20260806081554.448531-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
References: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hyTaHs0b6X_L1MG5e9SKLN32qy9TwIKz
X-Proofpoint-ORIG-GUID: hyTaHs0b6X_L1MG5e9SKLN32qy9TwIKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX37joMDq0fvfJ
 yt8Mo7kE7KlDvtPxlZcjYAM8VtY+/2ZQa63JR/gRVedAFN1dNDcUznPj5GJdpaUDYEh+3K/iM8k
 XDtkfaaG1bgY6VBveeTcl+0U5jKh8MkXrISKLCCnGgCq0gPjllkORwKv96mJrehFYRMreYWoPYu
 HBFu6aMEW+lk6qbAiQIi3nJu0FWecYiWmpD/KIEzdEHfnjjs4YyolHO2b7tWYfook6bxCpXMCMR
 hWgHMAlGyNzaAplR4TstDMu5zeWbDNwf5s8QCzNJpGUMpqB1IwCk3D25JMs6C2X/+s40VCoogxt
 g5fxli4R02RzU5GETGmJj+LQEH4ZsUzlgDiSHDTE0zM070DQ0DGT7G/0do7P56b+mfzVVVwFD1a
 2jxqfrk1bEr/FnbyXtCN1iBizq+6wiwfYTPpuNoQu3Bg4bZmisj96cqZfMLd6pJZ2JYqNYQMS+I
 i0Kyfp8kXVbI6mNDoOQ==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a744304 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX2U0Yds+Vhy9I
 D4rJ3kWL6g3EgA/eqCu1//sbQoCnsr/c/uy7Xkr3yDZhBS50CYPSi/m3Lb3nGu4m9CMruynLiA+
 6TDnHDg80VdLVOBPN46ibvRvpH63EJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060063

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0


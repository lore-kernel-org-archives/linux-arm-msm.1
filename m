Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F914968FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809568; cv=none; b=hKieBTIPx4JGOKmDX5tFte64OcjnnNLW9fWCvTHqV1s9xgdT7mhsa2CU7c+DPtBps5U/t0o6+SsEZvJuYIxDKmXW8DHZgYHuuKMdCZseH99IDRBuUdGm8UypzudMnucIReNE0cFcuyt9dWq3yb0KpxjW2HF4Q6ApQztOoqRftBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809568; c=relaxed/simple;
	bh=beF8BX80+h9HJHMkGhxM0lkj9SXJhy+e36vhzwEqyPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dld1hiz7Kpk59imzNkItJNdxC9aRr8z+8jtYAKYILUKDaap3uQpOnuj+mx4wTE9LAFRAkt3kiHZeWOQL5u15z16wSvoF8q1NIp8hPZeVgrkfwaQB/liOKW3z9H4LW3eMJyRsFWMMVnW/x8OeKUSXwVFsG7OtIJiTqnply3IweVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1t9cKFY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMMBzi/Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1t9cKFY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMMBzi/Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NC68wd3833586
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=; b=M1t9cKFYaNACdzyF
	h+ulg7NZ9djw/GseHG64J3zzzrPN6Au4yCoeE4kwdl6/OzKsXMhz96uuygJojIxP
	e91QvQuzhum7aDulj6CUv98b4uATccdA50I9s6LoPAn55FYyrRq5Ue8RF4SO+Zlq
	2cj5ImJJ1Yth3JC+qqNv9KOjzCmAWzQRUn4vXGhzrV0Ck3JdIQH3rl4NB/wtpP7I
	JSLAJns1+No/InXS53uZVZlCfpKlNH70Jsfs+K+VS7BK3/njCX+FSp+eoYBYq2xe
	O3IIUPv9rqxEIML2efPTYNM7Aa0zqQe0T0/FcOif0Cf1+HCt1IX6I30Dl7pe4Gcu
	1SolSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu82r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so15950141cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809565; x=1785414365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=;
        b=TMMBzi/ZXw8+JAZTPkyhit77qISVpj4x9g704nvveyrNMpX1+eBYassohlzwIJ4Lkx
         Tc6BK7ZoEbCx6QyzhJTphGSeSVDoLFmsRSl+xYC1RRmNslIvmMTCeUDvNfOgMsxWqIx0
         DJ5iMQy4qktC3UgrmTgvQR6rJtwT8lBZy4RrtcyIv3dSnhRoEGlKdeYLjMmfy5TrF4vb
         7EsSYKjEHF+wP8/rJ7MjkFM0alhga61WBK+S+D4jOFcLY+QBIlFaBvK9YaOToIMYogte
         NVFSpy8c9mS660hVov99tvFmYPoZTKwMQ7+CtFXHwkIF7DDeA1CQWmQDJEXVgWu/O8wH
         Stlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809565; x=1785414365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=;
        b=mrs8yvNg7GidPn6tOLpScuagKjs3G7eR5ZP//8j7CmAWEyrgevVcQOrlbkG4uLoZ/5
         CZAAA8YzP0BRSRPbC67VgO2W4mYIxs4V/4DEgCgXRfatWwgLBDZZ4058Qtk2LmXLVp6d
         Zrhho/AELx0qi1o1ZkV7ZAsw2T0z1oEcutrw+wD5nyDE8vI6Yi4k0fJ3dAkFhRZPn8Y2
         IMcDl3g9y95jZKNgqYrXxFC0Y7sDR1UsYI0xWQej4Ujh1TcwInQ2DYi83ZVSYVcITDIy
         Nv/xo8r6KJJKMP7hhcb9p3lB3wekc6s+LTeGzgsYAxraZOjywDYXwcO/+fQZFjI3COMm
         RUAA==
X-Forwarded-Encrypted: i=1; AHgh+Rqy0qm/BaYdq6l8BVX3wYp85Dw3hosgbRcbxeZJN63EVeVWb5mNjPvMSBUyeEkT379clBYAyEvmDKc1Uk1d@vger.kernel.org
X-Gm-Message-State: AOJu0YxjqTmpKUGHFcVZtjr6J+2dRJsP617Fvr4T1Z07O07YpF0cUWFU
	k+8WEaL3Eoez7UmqNNip+7Dccw23A3suSsb2g/6alO6THVhLT5cHhl213yHs3iuI7l+ljQmPhhq
	6N/cjTMYE2Dg0M1AkHBiR2mnMJnGEGUBXya7gwiVEdizwZjLzcDy1TrhSkr926yN3COri
X-Gm-Gg: AR+sD13/lM3N4P8pyV3t3DUbUglNzmqEI3THvLCjniaJbUVq0n/r9BxNlHtxubDnCBd
	nBtl8dOGlSb78zfgt5jPILeB3pe+F+yLDgJHZuaUZFzlQZxYGbjKPdPUSS67KzoHhuv1v9isrdd
	KLtnDqKlEnMQ8J2OWmhjPNdlOLAPgBOy55mEyakBT5BWah91DJKbgVHqMy/6ZIkNONGIKbk4Zvh
	Z/upPq6LWFzfnGW+zOMxOynPLtGXTzBvr90dtUqJtgNEQqna+tRT6iiqgGMs6Lh4ciXge5XRvoN
	4M9syeMBne1yfQEz0nO02xEZbvNx6xSO0t4rbtS5HtwzRySu3PE5QdIPJbxKSvmCabF00WHbqjd
	4TArXYrD6
X-Received: by 2002:ac8:7dc7:0:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-5283df5e7f6mr23996071cf.62.1784809564583;
        Thu, 23 Jul 2026 05:26:04 -0700 (PDT)
X-Received: by 2002:ac8:7dc7:0:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-5283df5e7f6mr23995771cf.62.1784809563924;
        Thu, 23 Jul 2026 05:26:03 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm15236106f8f.35.2026.07.23.05.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:26:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:25:51 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-2-93e17e687384@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=beF8BX80+h9HJHMkGhxM0lkj9SXJhy+e36vhzwEqyPU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYghThKqCdj7WKxvvr3sjOOvqkgPmh4bHERG1Y
 nhq8Y1X/YGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamIIUwAKCRAbX0TJAJUV
 Vo+lEAC3ynBLfmrcKAzPzMM+dI4AozDw36FRV2LPdhIWD03CY3hBDuGD0l+LKIK6aK0KqMlm7iS
 Lsx9gyuYs1HVBggKzFxyv6OjPxQMBFN831c42x4QC8SdGhqPf+186bOD5NpIjM78N228KWqsubw
 8/fbr0N9NJ1F+GvOue9VJqzG0Z/J6wjiIhBF1T5RuL9wwC2sNjJURAZdfX29nx46qHHVX39uukf
 FJpy9YKAYoeJo9NZNcKteCzMKeXlNb8vxajvggKYISOwwiZHdzKDBEFSDSp/RThrlrHrIM9n8ti
 toqMDdXwdf/9r47VY57xgFUJFj3ymC7xhu2bNYdZG4k9Hm/ky6ogbxxbWVYtJINExBa3O7CmboS
 x0J7o/GWt5eZU/T3aElLFyXm/7lRITjUmFxp/4dplQNQ8WjM9Ka+UV2UulLoMiabGz83gO4tVTd
 w4w7Fvx4YPylEORh+iwy/vjvOye73rWG6w8kw6Zrs/SxIaHrWvtIBPwwvF0N1B9fZJJZk7MzMDy
 ozS2ZqyRK4s42BHE9opJiITa630NevLfDNasGr1mv6UJZQ9F8i29lsmKI5laKc236E3AAff0hW4
 C8UqKkrqAlAjYYCQMREQ+PrSuSRfPuy3zUrgb0jVM4hCUlFSRMfyybZdpFptvk4rcJLtWiETS6q
 vOmQXSLy81C2MWA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: CJcTDnhDBXqfTawADuLfwyfI6rQD2qvE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX1PA3KuO+fW2G
 NrT6fUc2bv+nK+GpPbsxop1HZuUuUSU9uIchpDfZVGgECO1nLqI+aeRBHgQVWmpJ0roptzUb6jW
 6RAdGHDJ5jYpmyEiqZQE2GVSUMRLcT7eTH0OAA85a2esWT00iVvz2GLB166eA3oweJbfJi7dENh
 TklJohmAXC3eIj4PQyQ89haiMTKNoE4Rhvm/WatON8fin/Rb3dTP+IrjcDw7ZciUiFWWhsShNrt
 2WkBopmWI6fVBbuhW2O9bRMzLxbGjIH4Q1vQn6VPC3KR62chkgU3xrzqHIPtMRd4RL8k1w6jqSw
 TJl/twfIZoBMto4QhXIhfplrmzjr4Yg8W2AZDJ/XiowcSEDfDJ5eKW+eMRlPpIRa2eTPlmvfSoe
 wFYxWoipu+6QFVNOyvZixs7GXsrglkBOOrdm83/s3bmDx1EtTyChgad6wMkfTPrxTyEfI73QtEN
 UfOJ9qxAhVhg1vo2u0g==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a62085e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX7U78gZxdenny
 No5cRZI6X6M+ujnL1Er1D9q/bJtdCF2U0ehPpxzdfApgBpHGcNwa4rX3DSbI72MJWXO3YO7eoAU
 fkcaXrz7t1PrX1iu0lcSBCpZuc39k1c=
X-Proofpoint-GUID: CJcTDnhDBXqfTawADuLfwyfI6rQD2qvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230122

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 5abc23b9b676..c5a772b05223 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -484,6 +484,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 

-- 
2.54.0


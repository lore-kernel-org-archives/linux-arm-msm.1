Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA45A4AA402
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559181; cv=none; b=g/4/I9fULm5WTXu2ZRTvuxdoMIJ22qsr1pzhFqixq9yZCGo0QL86Oz90tSZtv8DtIBT9I37I0VGq1pIJlXvnpKGZCzoMP3ZrDtHr5KB3WssBHiKew9otr2BgiplhCFkwaFz3YarQg5MXqALUiOMY6+t7N9oLdvQXnd+pK8YZZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559181; c=relaxed/simple;
	bh=QiIWesU7FzZBm4bDxIVz/01jYmQAejuTJ+yo5+sOmS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XCkZLKnuVMm+dVbslmaXCId76S33j62njfWtDxUKSHpp0Dwlqmav8R6HPD1IPCEABf0Fzld7epJVV6BFOJFzKShukG6k/E0ZENZZ2PPiuTFGy0MoPIpM/EAyAloNFc1XTDCYl5RxIsGpD37xzAJL9UVoRXwnQOA193imlp9qtec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5RUp+Pj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SElmUuhr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5RUp+Pj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SElmUuhr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92eTe3169108
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VeiWxyRJnXNn5vuIQ2+Ltr
	kLyhTv6TcCPGxdOPAsIN0=; b=X5RUp+PjThE3fcRsrLTk8M0Fp4NUOA0brp+lQT
	h9W7VUrkg5mmeyccN5Vcro933mmT5SYuGQ9/mq5/gU5kh1LoucnW94+aHxj+4nk4
	CMVAAfqAMAk3oY/RA4UV6VsJbKzMJeLcqOAbc7/NYFGXjx/ivIJPJzRZwVXkuCfT
	92vNwBsJbV7whWuxaxOWArb2vDQZ2ViVqV56OuMvWgX8jA2VltcO1j7MiWO14O/L
	Dh0b8OT7OuEbCHnichDtCbE9+t6Rx3lwwNW6x3uOEXfjfABQXQjGLINBSvMh7p08
	iOALUioCTJzEyqPdIdxNiIFV1lCDSTcpejbJujcEYNeEswDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2ryj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:46:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so1033475085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 04:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789559162; x=1790163962; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VeiWxyRJnXNn5vuIQ2+LtrkLyhTv6TcCPGxdOPAsIN0=;
        b=SElmUuhrmgGcfBGrQIme5jNoc5ytWMyuKdv+zri+5/b3k0c3iCy04JDtPcRT2AG/SY
         T2rH36jH6GdQsnWx1DXXbD9jrxeH/XeM+f/tX13lJ19kJECITBgiOyduuKBZxGeEIkCL
         HJPmCDHZeDVFJtiAwI2xvlyZ6nMqRZKhfsNKB/JX+3EArjQgVQTtJixz3UM70jDrU+5Y
         i1hOvBcvLhAOu1+npYxU0nqMNJ7RbvOqOYh0JuUiN77jaAuzROIL02sz1OIesSBoXJ5/
         bPDONf7iW01HfljjeY5H8WATxSNuGnFrQFhtJqAEjv1XIxE2OT77pJSSx0KqL2P5trGe
         z1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559162; x=1790163962;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VeiWxyRJnXNn5vuIQ2+LtrkLyhTv6TcCPGxdOPAsIN0=;
        b=p6TRPKzoTnva1QaLGIE+PLyfoh7Z1fZ3ZBGHpxtpw8gNj9/tGlDyQzyb600Tz0bdf+
         m5iyFmJ6qpdL//FWV6YisHoLFATl8Pu8Z/kcbEwGTbPnBqFSJ9F/XhM1D2b2vsM0Js1j
         6O8LCnQzxDG9UN/w7fyoYIJUx5p56LxvTyH5gOnfoTiU3e3S8syzDSYifrPa8YZaF0Th
         InqVZIteXTcVrtGaZXsitXZEBR5WIVhFesQ3kTTe/lyt8SlzVS50AsmHD23+9pRH0Dp/
         pRV/JuzTiLwfZxHHFFDlmHwJ/QsOYcA7QGoM2+XDzLAPJoi9Jp2W1Vf0xg2Td0mPw5Z2
         Gb7Q==
X-Gm-Message-State: AFuF++kgw6LbseEGdoI0FP7wX0DAlRapgMFm2vCJUSrzZz4OOY6THyas
	PVdvGJnYIvpMFcGyVMqXINIy8D6QnP8jBIPZB6Ipdo280/VPlwpQm50+m+1mF/P0nCSQCDVAagC
	v0c61YEW2Pu3R7+XNeTrOAUFd1GgbJ8LGntulBXofvnriBQK7xr7OU4+GNhE4RUmG1fMr
X-Gm-Gg: AYBFou2vJ1HapbEEyb9TNT067FQylf3Ra0Ujy8eult2+JtyVodkQsgbnMssG7OB7vzj
	4P3jV+lRcquMJ+4klG7ONepqszN+k5QKe9uWPvIoLyRHoyxZr7Pcu3ebu3V8YFNVUFR6Hv4D+5y
	yE0b6ZMRg95VRVz6qKvdshLw+yfGlqr3ug0fBF1vw4BBG6+yGFIf42zc0vx958OCVVSs669ju1k
	/7tQnkRev0DVROYMeuGb1N4VCFDnPjy2LJp9qMlMRNWIPsdcTzr7u2N257/uhuGxBDnNuzVhAVj
	UXBF6YUz6aNlvrmluv2ZOv9IIEmBv2WYI5vOZSW8L6UEsrE1SqN7dNFt9669SUGFmuqWKYFxuXr
	CUB5wpC4=
X-Received: by 2002:a05:620a:2704:b0:937:19d3:3fda with SMTP id af79cd13be357-93bb785c5b6mr382012685a.28.1789559162201;
        Wed, 16 Sep 2026 04:46:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:937:19d3:3fda with SMTP id af79cd13be357-93bb785c5b6mr382008185a.28.1789559161665;
        Wed, 16 Sep 2026 04:46:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e841f19f3sm75586605e9.15.2026.09.16.04.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:46:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:45:53 +0300
Subject: [PATCH] clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHCBqmoC/yXNQQrCMBCF4auUWTvQZhEbryIuksnEjppGM1WE0
 rsbdfnB438rKFdhhUO3QuWXqJS5Ydh1QJOfz4wSm8H0xvZusEi3Kz6oZMyZCLPm0TmLSd6YIvo
 pYElJeUHah0BjNC5ZD612r9xGv6fj6W99hgvT8s3Dtn0Ay478NIsAAAA=
X-Change-ID: 20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-c7bbc8d29f6a
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QiIWesU7FzZBm4bDxIVz/01jYmQAejuTJ+yo5+sOmS8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqoF2em/ve1us/dY9yadOl6+fxOd1jsRMWmJOR
 lvDRX0c9l+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqqBdgAKCRAbX0TJAJUV
 Vv4wD/99jznWrJv19lZV3ouBRl1bG5it7f0Mlcb023yj71Kjl5Wg51mT23nV7W9LdvBiYm3JM3N
 HseoebR1mgJ4VTPqmytwOdrwgNYqazBS/vlfY0aiitCYHHxaD6FUD6G9KtXAPySMlJqlI4zPso6
 ifKY6EDoW4JBGAp525pJP1ewrJayZL9Jmh9gRy8a/y5qK0+9bO+k62EDOvpGe9SODxBmtpnMLgw
 9VSScPrlM1JLm7o3bXbuBwbzRzBZNkX652E60jMBTMcjApDw56limBpbIDz9ySq6AQNpd1LcHtZ
 iv9gRNadp0tD2ZpuQlpzv9YhduWH4oJKChQt8ClVmre4JbmATwKzVxQINsuNfU1mmSOSvqOmGpN
 wmZETjJLyaaYrpkA4GkF+2apPPfgy1D1z21fvC+9S2dlV5hfUjgZmH9HtDd2x9ILz+wfSm34zwf
 CesYLzwQVHgQvYEmBgCss2Nq2804jHqt91qNUqo96UNEROZ9cEY1cgr/3NhFp5f7FpwASmNEMbU
 ps+CaoXH9MFGgzFBCD01p/NSuZhlJz19WcFdKtwfHt3lw3x7rw8b2ncMWX4NthgUmOZwCeuYWYM
 ogHRU5OXgDiu6NTYrmDY9uTaD9i2lNgLUNl8tS2iZQswLk+Yri5WybdFddt0tXF/m6MXPLfl3s1
 zBC17096dbTbgrQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: kGaxb6gBafOR2Y0XAvck93a3k0inwl_X
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa817b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=x-KfI9e3SCgyUP7ysD8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: kGaxb6gBafOR2Y0XAvck93a3k0inwl_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1NSBTYWx0ZWRfX7AW+g0Fx4kCn
 5nrjw5YjmzNS9KC6ElEgNCGnQVzpUdmm1rN9SV2d/s5B/WyvIthrWxsfTr/vffILsd4WeuiI68o
 WtCIa8fN310toLkN62v5rCMhReqtHhHEa7BqjybSVXUAJEhF+fqg7O2vLKMjSecKUWswy8Sn0MM
 g3CNCSxWyjcnc8ZSMxJLuIj5eMK0CPS4/6lZRzCgYqOke5YcJJjfOx3xTscdWJFwFykJOLbz5UV
 KVk13lxnbhTQzUZ/T2oLRbQRnuAsJB2ALxaqZ2Ljlwe4ubF/tHMLmYvJoSvUoqsf8Bb1nlZO86s
 MeQ83lWFj3FNCAY9FaQVfiBxqRwaGDc+kPI/j7jwwjmlOTnYJm6TzLEUbIr2seL4dnLWirGvpNw
 pSfwfxpZsBKb9ApBLkGXjVGHWp7GPdoh8mTkgTWVcaS/WMrb60bFkl0lHWUKoxUMoRvbevIxdr5
 YtBKkOJ26Rh8Joy/tkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1NSBTYWx0ZWRfX/psZwcXfH0im
 YfaFMX008V6X6b/ZAccQgralhjp5ZqzEc/y4dF6liSrwfThY1/tVzYmjEp0GTNDTAa08azqNSDw
 d4F20maWhxZ2NOY8NWxW6+eNGb1F4KQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160155

The FD AHB clock branch register is at offset 0x3b74, not 0x3ba74.
The incorrect offset exceeds the regmap maximum of 0xb008, so regmap
rejects accesses to it and the clock cannot be enabled.

Correct both the enable and halt register offsets so the driver can
enable the branch and check its status.

Assisted-by: LLM
Fixes: c252659770db ("clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 3426e3dde924..ef7bde361fc3 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -3133,9 +3133,9 @@ static struct clk_branch fd_core_uar_clk = {
 };
 
 static struct clk_branch fd_ahb_clk = {
-	.halt_reg = 0x3ba74,
+	.halt_reg = 0x3b74,
 	.clkr = {
-		.enable_reg = 0x3ba74,
+		.enable_reg = 0x3b74,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "fd_ahb_clk",

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-c7bbc8d29f6a

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


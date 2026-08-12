Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA95393DCA
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786516149; cv=none; b=Y3Y17h4ZSzEWVHMZNg/WpARTIzUCbggjDBQ8HbmcTZSKGj8bOGoxo6TeJjBw+WaVc6WeCjxDnRyP2fK1ON/Um5e2/yTm50zsN3g5rr84eMDejh6ybH897AlGXlJKM0cUlfRyYb32CAdI9gfbrnZ0Ed/ergp5AS5f/NHs2NkXT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786516149; c=relaxed/simple;
	bh=GG0w96D+OpoQ6WiPNUe0lMOUNLRENupvVJXnMJhO3wM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GK9mVqWE61jnduFBiIhoQmESiPWOEgf4SGfvbwVHMLZhIsTDi5BmMrDKNW0ILUBxK3wY5nRmbJBVhbR4g4vIRwoL5sNPQA+HyYS32QRsanmrymBd7LwX2OOxqhvufojmcpJFqLFYqPdX6D1VVuRG4jrmiQFq5w9YN4IGngaOlpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VngDbU08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUGxuGQA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VngDbU08";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUGxuGQA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62OHc2872356
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FV36Behvff/cJ0BBJ+JsLd
	MXegQW7S0ah0/FTqQuJ8s=; b=VngDbU08pNIULyMB/F3SsaSd6ZnrW0vB0LGm+3
	fSkUUyx6uTqDVgTfqQANTVQTnEhs8bObZ0jNhbPTAof4e2+xgHDyIoRgpVREx6Nv
	MuAB/xdiKxLKS0nROXseasyotwdn3t8+NmWQzjrNK5zfjpb5pQVImkQVdrfhKiFW
	rVGe2upJ8VSNFhPCiwx2ahn8CE6EDK/2bR9FoDiholRV1ge+Li1W2ECmiBZ7LCTS
	R05/QqAaNJNvlGBb4/7zSWUQU6FehxAPZl/L8QZFfu7voH+4sLq+sj4fOVq/k9WB
	dQNV7wwW3bkwstgRQiU7BFyHUJBe9g5yO+PEneg/nMz0N9eQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1gemf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fcaa5f82cso711452a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786516146; x=1787120946; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FV36Behvff/cJ0BBJ+JsLdMXegQW7S0ah0/FTqQuJ8s=;
        b=TUGxuGQAaev1bnVrJp6JuuUyw8Lfb36HgCxSttFq6yeyi6BjPTWKP9poop1zHAMesw
         mKAw+L25o+ypq5kJGWokMQC61Wlb1aL8V8GW/ztaivOvqmGUlsHE7YBhIPN7HSL4MnIE
         wlVLhVAWVE4lO+qVfKQQFgnKBlyYQM15W1XTWDltzvrP+WrQCVZ5ywJlYFHWvtxgroAG
         VcXD5vPvb5vObcj2Nh5WkFpthIrBTbeIlPwh2xYw13NCVmj0XyflDUAPzO/jKR8jJom1
         zQU3TN3TjPsGUggQceRr38qTmura8Jrou5FUtqrAVdTEXDvhyQdc4PMpVOuyySkSanQ4
         WuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786516146; x=1787120946;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FV36Behvff/cJ0BBJ+JsLdMXegQW7S0ah0/FTqQuJ8s=;
        b=nAiriL2Wv3+QksScRhfT9KNUgkkD4l6zynCoNC8vxIiFmFpdHdJogbQ2qCSFR3xOuk
         OyJ4qPrCJdrvDFEjcbDys8H75Sci3KSBv4gzAYISDgNZYfVzMcZK9NJKmR/VD+ERUu3d
         yjIl1fRrKt5pwD8X1FMakfwlHG5kXN67r2Qpz7kKfmtNPmRf/y1SmHxRTE6fdvWZreqK
         wq7zl1Smw+MQBWBOjMIYTBl94qvXPU2jzhRjfNeiZlavvloK5qv9/szvGvgHQh0hp1g6
         kV0lgc+3GIbU90J+oXv3WfNXOAXmRKfINtkiP/pSkWZjt+i2hZ+aAtYkNG2H8hYk1scI
         JzmA==
X-Gm-Message-State: AOJu0YzD793NUOBXAeKUNY1L081Oklvj39HLS+wTZHIcYhdTz25S/v/h
	ttLOMziy6vpZxTndITOf0qM5ovesZwe3dNaI9JNYnM8tbYDx6n6yz193v42ChcicWN8Pi3SJJUj
	WV8E+3ydfyntnx2kUlBzJz6/cT0Fe6A7nJE/8xiiCFnQMQe5403LFAT28+T42ojaP//Rh
X-Gm-Gg: AR+sD13g9Dv8cQslNcZd/zU6Q4CSDH12Pk694aErEM9x/YUuhI6UDAiMFbv82VshHg/
	2kc/tOSEHKKA08EekWkWh2w9F2BuP2froDzPEa9YPS/HcRyR9RomKi6mUT5ArYxmySAvpzgFO9o
	f8toWzAP4pMvlQB8EYBjy6WP5nK09n3XTY6r0SAhm3RDuF2+88IFA3O3GuTy6Wgg8sdiXELVEfA
	Vuws38T8g7iVOkrdWIwFVdeXiBqDW9r+N2B1rjtyQRBEHwt09R9jU43tQeLpvASeOAvgd1KuwOH
	HJgWkUjUiVNkcJocJSM6NVqyI9pgi17l1jtV0le/i3xU2WzE3Q6nzDSEHsl9oVyhWsOkTcU2x99
	hI8V6j4T6iPYECGaJNCR6XS0DcqIEa8U=
X-Received: by 2002:a17:90b:58cb:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-393011e2e72mr2751232a91.1.1786516145642;
        Tue, 11 Aug 2026 23:29:05 -0700 (PDT)
X-Received: by 2002:a17:90b:58cb:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-393011e2e72mr2751202a91.1.1786516145123;
        Tue, 11 Aug 2026 23:29:05 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392fe5578basm549377a91.4.2026.08.11.23.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:29:04 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: ubwc: Add configuration for hawi and maili
Date: Wed, 12 Aug 2026 14:28:59 +0800
Message-Id: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKsSfGoC/yXMWwqDMBCF4a3IPDdgohnUrRSRXCZ1oGqbaC2Ie
 2+oj9+B8x+QKDIl6IoDIn048TJnyFsBbjTzgwT7bFClwrKRSmx2d0NY4jCanYfJ8JNFW1UYHDZ
 S1wby8xUp8PdfvfeXI723HF+vEaxJJNwyTbx2hSb0hEZZrVRA3XoKxlmptfRljdoadCQrF6A/z
 x+ak85dsQAAAA==
X-Change-ID: 20260812-ubwc_for_hawi_maili-9336fc68154a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786516142; l=552;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=GG0w96D+OpoQ6WiPNUe0lMOUNLRENupvVJXnMJhO3wM=;
 b=J/c6+NwH7VDXdbD75+zLTJGoMR9ZNBHEH1ev1Tx162YU/AECPkbzI39cnYWlQ4hl/IDtCnAEq
 z6AXnEtaYeyAQ0JNs67jAcLt0U676S4eZ4I03/tboqC3uedJqABEIeN
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 0dhDAHVcIDaSXshsan_T5oGwg9UxC87m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0OSBTYWx0ZWRfX+kBAheXCQL7k
 u8N7BvCjSIs/g7lyeC7IHr5ZvdfloZUKMlhajVDWfTwPhFgtTdvIIpMatJiF9pA8INj/o5J8sJ5
 3TmhiO0JBhllEJZeLyVgRbChtO0JGzjWlIah+ffizkdD8zhY1cUy7zszw3gS/0ECrB5kGc6EO6G
 XvVZ0N/6Yy+glXSld1dPsO5lJwnDEMB/ihJ7ay8SBZzlYFIDS+lJRvt51qb4qLH9zEKrGijPdQG
 Eemn/cgi+QuA+aVh+6L0+ADYtiwnpX4utTRAfyl/uAzijggy6XEuHHxMeCHHnCyFyps1VJwXusr
 s8YB/X/MAdZDW4LTO+tMUV6VH27RWZyfGoAXdF46rZOzPoHHFITnAfC1FjTyUP4cburlIsjfjpJ
 jYeaSbuN4POhZ3DNDed5r3BIuB7AcnutkhmLzWW1jVqRetDVr9UYCVerqSRVbiYqGdii6Dijnh/
 2jcsx0fPs7ITeUGRilA==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c12b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nqq2rdn76_rY7cRpNS0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 0dhDAHVcIDaSXshsan_T5oGwg9UxC87m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0OSBTYWx0ZWRfX+hP4VrPUPJo+
 poJKVyUBaMlFQdp9iY1kPJPNorSvKvfbLagTdx6oXGRnFXVx3w0ohiYQSuJN7QAYdhANINesa5C
 ECljk9oUpEV+iXVDNhkm22oKri12kJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120049

Add UBWC configurations for the hawi and maili platforms.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Wangao Wang (2):
      soc: qcom: ubwc: Add configuration for Hawi
      soc: qcom: ubwc: Add configuration for Maili

 drivers/soc/qcom/ubwc_config.c | 9 +++++++++
 include/linux/soc/qcom/ubwc.h  | 3 +++
 2 files changed, 12 insertions(+)
---
base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
change-id: 20260812-ubwc_for_hawi_maili-9336fc68154a

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


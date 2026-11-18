Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981843;
	b=nVJsHF/C1/hJhZf69XmfFu7+P11sNkyH4EpKNIz0WYKsM7A5dHtTJAG0QcQvJwMKhGFt
	 3/cxOMAZbQ+KcZe5zZ5eTPHYkj/PKnS9CTR02MpRPb3PRVdRxLGTJVth5C9Qprmhlsn3z
	 tScQaTiPX23VEprvezC7gNbVRFTNjOyvYL66oRaIWHRmT9Iehg48EVdRu0D9ZbrP/VlqY
	 mHyrxKQuf7QMjiXxutJPIUwP385DUK4YQ25XDqFXMQUxF2ktxNdDphvwUD9fxwvdqWu7I
	 U6RL9WqPfxSAPIsfB9l2K31sFstiDYa7qBn4Bie4HaA40YgM99Il53IncYxxFhfvxLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
	b=z16ipttu3orZhqzlrJ3fpuB/1dQMmkWp3M+zr0txEFB+34iVQBgugF99zVOwzhO1OTPH
	 31aM7a1dDAZDMYDp1z6aEVLPVfU/fDZE0ENrv7raQ891/e4lwuMoaDiqU3lHD6lheykBu
	 zquAwjaB8H7b4KJrEcWLKpfLCzqlFF/lJh7A/FPg7GYS1suuPntu6jJveNm8BnQKnHEaZ
	 433sTPlBwb/Qi7BUpsnFbRGUZxKD8ugwuxnHLa5MItGS91NZ/3l+P8YxRVxlToGsE2rOa
	 OA5dUdMUdMsXfuh+EYb4Mx8boWcjSikLQIfF+hMUFgVjEc3zZqu2Yx9IyYWhAdyo+YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODLzB9Nz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKFJ1+8p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A596606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A596606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODLzB9Nz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKFJ1+8p
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uwun2602438
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=; b=ODLzB9NzsoR0lNEF
	ZzoB+jPo4bPp/S9ZPjHgDQfiR8lRs4YfiF6K9wgkdfE4voD+Tn5MEngRfXWG0OEe
	or1JoL3J0BO/86N4h2fmbMrFJRDgePzcDrEuq2ijOLzMqW9svSyq9lFl6lqaTEd4
	jR4pTs+yGsBh1TOg4LYOlZuaOZ+esBe/EDvHHzcg87BnYpvsJt3EphedWoFfupDD
	N/Xivm7+zxJQcIXXaUAAzHRs/DnGddEYiE5TKrO+mfUE/FLWPDc8xbD9jbOEpCJL
	syPP1P8OLo0Tx4izNSaskD+SVptgji8jo33RwaXQvZOuSeRPN16hEeN+mFvw2ITv
	6rGWCQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71fr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efdd509c6bso8232145ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981842; x=1795586642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
        b=kKFJ1+8p8sfR5rqK/G824nBJF6Lwj1LHFDtBJbRxlL1Yxo7VEFIDJ5HH48iNTnqzK7
         bS6qDTcPaGHDvTwbKOd+1M/RCOujeuJzBCUkBaxNClp3SWas/mCde04S/DavsrgFAR8z
         K+ssWDPEswSu7Lhscb77VcXtfjuiMFrCFT0U8n+u5JClNSXZYOX3TGeJQaUaudDzM5cR
         WKDj4xXOQTGHTPOBbVsIroR3JVjl7J8m3lDqcawv51DmVI/8N086UHp9t6BFWjKB4Vc3
         3uEWmKwHU7VgehrYjcWshcCBU8hWI2jBlhYV4UdVkJSZjfydfV0M9RWxJx8L7KsbRg82
         AOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981842; x=1795586642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
        b=sO+YhfElADD0BLbblpOJq9bphRmivjA7GtzEmctusb9M45G47MBkYirXWZHmPHWGOJ
         djTtCekQIE60glSKkWvfEP63NetqEUgp0WKFbWqv8rV8Gz8xXXps9ZMls2C6sfERKbVe
         zE3oQSyVRZ5zl+pBUMdvPO0mESmaC78jIzuKqKFf8HB4VKgi8QhnT0Mc2uhVvyhTs1YB
         Z0X8fCZzisvGNQzEJXEWxj9fkZ85Y4uKInAT0PI9+fdX2LIVZ86xipEkPUgKF/taovTY
         o2MRJ3UDGYaj34GSp2ZIpFIG3CfUrlxk1Ex4O5GAB7JfpoARvTa2vi+DFHN55bScCeWU
         QHzw==
X-Forwarded-Encrypted: i=1; AL+hErG9rEyDm3WL6wQIjsoucj3gMdFG8wB1vOzD4ijGL8xnDEJfY6EKC7VvsgHIAK4pgNz7eCLtMoF242k6d67q@vger.kernel.org
X-Gm-Message-State: APuU4Z97vZkFyHWqRg+o4IqCGw1VigZA4Lw8onn6OouWxs+e8/fe23gK
	KUr0GxzMs6yRYmJFzXbrt5NDAHTolBQLNWxLBbDcsjlQR+kMXZ6YXal+SSZByJn+v/o1LTfemS7
	1gBRjlLrqEGxodrj/xKp/ZYLx5npMIgiwvSZnAmGLX6xU69kU4Xb8iOpbk5W4IbRZBuok
X-Gm-Gg: AZFdTZcS+ZrguoC+EKGNx2kjYYUYMLz5M9iZJ5QwPGdIZGafpREKiRJDoRn8h6rIyE8
	vrPy2ejl5bvmPVXsnIqjY3PSU5N+GBl/8UcH811Suj5p38wWzhi+9vtQzXWvjJSJfhzXMUHZA/j
	LXQT/Pe6qZZAug01tCZbx7Cuex28BO9IPoa9Ukmx6QI8psfqix6t1yAT9hqE54n5IU6lT4FFmPN
	4i781b+oI9csjp44kf2Mpfj0obusIooZ6tkiOxBK0PIKEpqxTIWcsncyO6UDLD0ooT6CNhsPECj
	eVNS5flLeXPAwmy4CZqU6ABwIPZlHvuFHj1R+8RnlDH/h9K32f1tfiv8eRkoAlP2fhwkVehgSzZ
	sEEj9MwNc4U/Uhy2RhUWcSPY7amXAwCTgIq6USjjbi27K8quCyzk4WMMEAPt4xctUCdQkeu12ZA
	==
X-Received: by 2002:a17:903:234e:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2eff75424cbmr16415565ad.53.1794981842032;
        Tue, 17 Nov 2026 22:04:02 -0800 (PST)
X-Received: by 2002:a17:903:234e:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2eff75424cbmr16415195ad.53.1794981841573;
        Tue, 17 Nov 2026 22:04:01 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:01 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:44 +0530
Subject: [PATCH 13/18] dt-bindings: pinctrl: qcom: glymur: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-13-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: i0DEUOmpdBoKksqHc2HdIDzcGl2GpVGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX46JqXrbBApPX
 IgbsMQmxVVSOFs6ufhec9tII53C5mrn2am9FjKSl3sXZy3rPJrWjEgXoQGlAPwpS9aQqk+xYql4
 OPFbQNM5uX4a0VXSzgWFsxXHzmnmBqaLnph3wNQvpJrzLPEoubpmL+PpiIDCgwn+kr6XFcJLRp5
 nba2sHXVt+5cV8WqAoOG2VQpWpky02avcGFjbYk5cGgoF59iQt/HcRO3gEb/bGayDQ1fd03Mqzc
 PG3J17t6ztuxllcDhKtOa9AKEiJx9YUBj6uCSW42f98C6GKm8XByKhQDT70MEcwWiNKBcxUWIyb
 huEdmqLT4eLFvaZ9CjTc8yOh4KYu7mrEz9SCGLnjVZGGT/b2SebAeuBe8uJWvhvPc3dYXKDUhVk
 qIuuNKVomjSG717A0PUwqGjice4iyQMKwH428GN5ZCghleKpedg/tgeMQDuUsZujvQP3wObC9MN
 KMnMYHOodrCOjVtLyQA==
X-Proofpoint-ORIG-GUID: i0DEUOmpdBoKksqHc2HdIDzcGl2GpVGw
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3fd2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXx6mtSZn6xhx6
 jm/Fqq49yOUUztXalGxGtNmPqoW/nKlA5kwNkvjAhJay03lorOmFfeP4pBdL4kf+B+1f0GafGDG
 m8BoXoSYNc9puKxO0BkpOs+Un5z3OjM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Glymur TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index 2836a1a105798a8bb5a38244f7cbf8db350b755e..6bb572640256d3cba2a6dc7571acba85dae57440 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -75,7 +75,7 @@ $defs:
                 ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi,
                 edp0_hot, edp0_lcd, edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en,
                 eusb2_ac_en, eusb3_ac_en, eusb5_ac_en, eusb6_ac_en, gcc_gp1,
-                gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
+                gcc_gp2, gcc_gp3, gp_mn, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
                 i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws,
                 ibi_i3c, jitter_bist, mdp_vsync_out, mdp_vsync_e, mdp_vsync_p,
                 mdp_vsync_s, pcie3a_clk, pcie3a_rst_n, pcie3b_clk,

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889555;
	b=OXYj0mpZy3V4EN+TL/bTEZZ3nBDhJ7uz8C1qkw0VqmMn52Gv0Wn/VnFDjm517uPYI2uU
	 EnF4edrzWnGLTGZYCcSCoAwBX9MWIKqVblA5qvfzYqKfnsjoF5Cbg8hMBn8ZNYkhtiNiY
	 Lb46IVhN1Wt+wCJdxPw8kNhoRCd6pqehLTf2Npe5EN20m3mdadeoq5jzeyH3e9dxVuZW2
	 h4gRsLOrx/gnwyefTDAIzn/Wsrt4kkyZ4OsJ44U5GneAnLj3DZgZV09yqIsP1z9O+OnJ+
	 S6sgi9aqZ/DG03ieKtovsfw0vl4Myo9+S+DGVtQEmRQFjNJ7JMbnszk1A2MppUn5WQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k6rZNiDVyOtTWb1gQc7S+eyCv7P9zmq0JSXfIQPmD7I=;
	b=luF0xSPshh5XwtyE0YMrJYTeha3RoxFHus58sUkwjB3uITG6MjcBbyBFMc0dcjK4mBZQ
	 TlzR/pPxGu7hyJt3qW5uhocJsksCdsWWc1aqx3ZZWq/SfAm84HeXj9jXvmIG+JrQxnDur
	 /ffGFladWYVkeHaY8mOTYXAXFfY/XjX2e3IIJXrsp+r82vQwkk/qJ3he6OHcwHpN5Tqvv
	 RINecmwBtEwCnlSN7M+nmJBv72y5eMibGrrsqNQ9IdEK48WxvJC9rXcBL/h3rNmyN6OlP
	 fMHTbeT3d1vgmbZX07jieiCqwb8VOc7ZPcfN8FLi5rpuSIzO3VVrP/z8aSlgQYNBEgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5LuiSl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ie2MDDLL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6D606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C6D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5LuiSl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ie2MDDLL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aJVP3142434
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k6rZNiDVyOtTWb1gQc7S+e
	yCv7P9zmq0JSXfIQPmD7I=; b=LV5LuiSlKx3m6SIn1woI8meBIyYyZu0bDJbHlR
	E/WMM9YSgjbuYA/ezHkOCmjViWiDET83+MejuajQnYH+b+T2DpiyisG3noKRgxsl
	Lk5Fmk6VxNB7og2/nz5b7c7DtntcFZLZhdRwtcdJC3ItYaDkPTAV8YbZGeCNZMzW
	geOWzG6/vUDn/CEjKz5HG0iYTU5aXAmP5wLRLFuwYJhFAEOBOOMuGD7I9P0iqidT
	Mn4Cimdr9WNqbWjFeNiD6+vV8zb/DyhwG8TPpOgATHqSMV9Q9dNyDs0TyJkNc2U4
	lrXeANw9p0UQC+uk5acy3cERK+Iv9ZCo02wk8Jb1838hVQBQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqybvk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:25:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so436462eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 20:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794889553; x=1795494353; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k6rZNiDVyOtTWb1gQc7S+eyCv7P9zmq0JSXfIQPmD7I=;
        b=Ie2MDDLLv6xZmnJhFztxnqBAZNLSjliDyMaKXDAMYX/OF8uBspVDEQ1L1RtRJ0p+rG
         R3qFuxOHJ6fj/aRa4MIy7nkY2skzrHl7XolTL8EhKeNnWnLaE801FBCNVSwi1vllYUmP
         j5NvXSoZa5rFFnK+0F4vlIVeRkfaqddcLmg/iyZ39h5607UX5zu2CHB3FNAnst2eMxCD
         w8Pvx8/JDuFushrDfOeSzXd+XVSnuMeo8731CzjcN2j7C5XTOJIRGFaNZHX+iBmBCLuF
         +CIDOKk0PbtY5n+bXDgGVHRldBWjBfB+UiuWz9VAzkuEM2XKq0l3mu1XqMMiyOcYwlU6
         oA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794889553; x=1795494353;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k6rZNiDVyOtTWb1gQc7S+eyCv7P9zmq0JSXfIQPmD7I=;
        b=gQGq3kFVtOHhkxw2DhpxwVaYhDOAxN+aDXiJ2Vb2gdBLGLa3qza9hzpk29bOMO7BKr
         lPypX4+W0w+Y+LHHN148qbKY0alBfJiCjPri6tl60Y4VSRL67g0HtU/GlpASfaG9Mtrt
         5P2qFu5W80cxn7aa+ueYc9b/tJTCVf5eFp+8rRISa7p3C6F6tEIlskthF63qWemXrCl5
         eER7aGhY6PmPuepW9vg3bygHDm41P0DGaIhoEjhoh8oTtOuTBVJtd7QPmTOtfYtfQmfZ
         kHjfFRFZoML6/PTL79QTJBNaQuKfdlm5EQQsXyRCvm6K1mlHJzngaQ+zCKHJpII3KsqB
         8m9g==
X-Gm-Message-State: APuU4Z8EDl1w+ou4YtruP6V9frUyElN6PCKxe8YLF9GeSKX0PoR+FIUq
	KmZGjXSNRHEs5J2m8znj4IhYmt8wnp48NvpgmMAkGHO+XebtNczgRGYGxGuFH6tgjsQ/k2PmyVc
	QL7XcrLgVOvHObjMIbuWFxNsiQwnPF5WejGYCE5XKyqI/9apRhx/ol1MdVZnDT0k/FLHQ
X-Gm-Gg: AZFdTZdOY/Zb6JGihVzNYV72rOKTj+cJxlvi5qMsHwh1ki877Z3fsgTRtDe2AaYEloU
	1H0WxVqRtjN42A3USBz4q8lI7RpQLa/GuoUglR0qPCkSOzqRG/oDsR6MsCNn4dAs1VAc9wyAJFB
	hcan0QWx8IBsTlajTo7irY8dWY19pQk2nA8/lVDbEuEhwY7wE70laWFeZ0picQ1ORUGLoXXEUhb
	IiYHLwdpMCNFwm/GeAiFJfVNnvPsB4vM3mNdsfay7DIYMUmSVpzOQgGXgv+16vpPgRCpmibHup7
	dcsOGjErS1OyM5RxyTuaLfwht/IcI2DYHDDdiXF8eqLr19mqViKi0XobUBcuAe0bdOT0YsZyWgp
	hjLjfXLgSjECYtZmjSB5LwGGT9UtCh6wrI5buJ7ZKUA6RGTYXuy6S0D8=
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr1972609eec.7.1794889552506;
        Mon, 16 Nov 2026 20:25:52 -0800 (PST)
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr1972582eec.7.1794889551936;
        Mon, 16 Nov 2026 20:25:51 -0800 (PST)
Received: from [10.213.108.22] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm39183110eec.3.2026.11.16.20.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:25:51 -0800 (PST)
From: Kusuma Harish Etamsetti <kusuma.etamsetti@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 09:55:08 +0530
Subject: [PATCH] soc: qcom: pbs: Preserve trigger errors during cleanup
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
Message-Id: <20261117-harish-qcom-learning-v1-1-9bb3fb956a9c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACPX+2oC/x3MwQpAQBCA4VfRnE0ZasWryGEbw06xmC0peXeb4
 3f4/weSmEqCvnjA5NKke8ygsgAOPi6COmVDXdWOiBwGb5oCnrxvuIq3qHFB7pirlthT10BOD5N
 Z7387jO/7AbU21GBmAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kusuma Harish Etamsetti <kusuma.etamsetti@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794889549; l=1822;
 i=kusuma.etamsetti@oss.qualcomm.com; s=20261116-oss;
 h=from:subject:message-id; bh=2XBN2cLSCu/xE8kOOiMNZs3/Lh9NYoU5xP+2HNXK/Y8=;
 b=30s9wBJQtAgl7zTvyEEMOJ89o2ph6m0WvjxTOQh0RiYhEZMvL88cCGmDFzlXNI0WscgMAQAXX
 34ZVtWt2ap1CqMZVLOEjoFwb2m6dzWQTlIj7TLl69Zeef6JixexCv32
X-Developer-Key: i=kusuma.etamsetti@oss.qualcomm.com; a=ed25519;
 pk=fgP5l8HzvAhEVM1Q1CD+AykWgb0nWHPUKt1k1DpEbvo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxNyBTYWx0ZWRfXxY4axxgx/4Oo
 VNfyus+8L6v5ny4+RVjMKbNhx8Jv4C3/TBjASCuQQBgqdN33AUeff3lvfE7alIvan9NwVbx2lq2
 zBI53reoFc8/jrGyDCmn3keBNBiTrms=
X-Proofpoint-GUID: lOuSD_02IlragjBQ3FQppyk8gRNCtTlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxNyBTYWx0ZWRfX+l1zq0zEd1dq
 VxE8hyCigO/GcpwOrXc6mNAmQFLEOMT3REzIdf/ihOcUgZ3TKKT5XTZ1TR+zhoF15KQK4zDGeQd
 H/gDeW9DklXDyrhP0E5NZ+JHbEUkP1cpW315gUWuMs5L+au6BfR7584bv39HBFP+P0f0L59TlqR
 eCRAUi56CyJnTtxqzNeyuDEfVCiKpkv7XK3eEqoF9qzTgI2Fiv18GxZ+HbEdpHXHDGj9ZH9v5fb
 KSAqjOwsuADXaVEri/XzdjBbjb5EbrDkVXf8iP6Do9Iur6d7haewSy2uoKecWAX7XI2oTwWDUS6
 Y6idXsoXwc7BIYZdOKoB7AIASjrX8C3wbaBAtDVzpiJ73kQVsmr1Zj900MYG8wdXMj2O54Pv9mm
 jmgmwS9gNyF3DJH8CbT63793HLQl0GkgIjntzLripPCx8RWD/8s5jM+EOmrNNzIFjgbblkJO+Ge
 xkTLBxeqQjpfA6Qnpjw==
X-Proofpoint-ORIG-GUID: lOuSD_02IlragjBQ3FQppyk8gRNCtTlA
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afbd751 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_WVhkm7O3-LuRnNm3jwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170017

When a regmap operation or the acknowledgment wait fails in the
trigger loop, ret contains the appropriate error. The final SCRATCH1
cleanup overwrites ret, however, so a successful cleanup makes
qcom_pbs_trigger_event() incorrectly return success.

Keep the cleanup result separate and return the original trigger error
when one occurred. This lets callers such as the LPG driver detect that
the PBS sequence was not triggered.

Fixes: 5b2dd77be1d8 ("soc: qcom: add QCOM PBS driver")
Signed-off-by: Kusuma Harish Etamsetti <kusuma.etamsetti@oss.qualcomm.com>
---
Fix qcom_pbs_trigger_event() to preserve errors from the trigger
operation instead of overwriting them with the SCRATCH1 cleanup result.
---
 drivers/soc/qcom/qcom-pbs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
index 06b4a596e275..13c67f85f634 100644
--- a/drivers/soc/qcom/qcom-pbs.c
+++ b/drivers/soc/qcom/qcom-pbs.c
@@ -76,7 +76,7 @@ int qcom_pbs_trigger_event(struct pbs_dev *pbs, u8 bitmap)
 {
 	unsigned int val;
 	u16 bit_pos;
-	int ret;
+	int ret, cleanup_ret;
 
 	if (WARN_ON(!bitmap))
 		return -EINVAL;
@@ -128,7 +128,11 @@ int qcom_pbs_trigger_event(struct pbs_dev *pbs, u8 bitmap)
 	}
 
 	/* Clear all the requested bitmap */
-	return regmap_update_bits(pbs->regmap, pbs->base + PBS_CLIENT_SCRATCH1, bitmap, 0);
+	cleanup_ret = regmap_update_bits(pbs->regmap,
+					 pbs->base + PBS_CLIENT_SCRATCH1,
+					 bitmap, 0);
+
+	return ret < 0 ? ret : cleanup_ret;
 }
 EXPORT_SYMBOL_GPL(qcom_pbs_trigger_event);
 

---
base-commit: 6a876df4686788cd39128b62d7fcbff62f39278f
change-id: 20261116-harish-qcom-learning-c9cc071ca193

Best regards,
-- 
Kusuma Harish Etamsetti <kusuma.etamsetti@oss.qualcomm.com>


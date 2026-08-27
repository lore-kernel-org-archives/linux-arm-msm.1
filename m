Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6101C3CBE89
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818408; cv=none; b=TU89aYzvYutXwjI9DBCG3cXP3zSal6zUs3xuzoPbEyXdBmHjOtuiPCBRp1kVzlO55ehtRhSTse95Am9JzWrjE0WeplmNYmhj8yU4nf9JYme7Oooe8GQlRSvkPcCekRYStIBBopRte+50cJaKnSfnk2FNRrqlDzoaXdb3toRLWEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818408; c=relaxed/simple;
	bh=t8GjYgE6EMM19F6RxsbIprvmjnmTi3x/F720AMusbb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N28REoD/e7I0YuL2SbMVlNSJ5ClXxEiCfD9b3V9ed7OAYB9cj5odXsDwXe6aQ+AwQ/urMYun953eOXGpqrNb+EL73A0s1SltQpCCQwB+Ap2m4WMDIMItBT6Awocqgpl5CfyzF9qHG1vclEYOvsN4iYLqeDzLo8sXc5u9oyjckzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4TXXrG5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPyJXvUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4TXXrG5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPyJXvUJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R6Qk2074659
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 08:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=id40phT/RVjPBVcSNSIiEA
	JtrrPWIXKWs4eDewBUW7Y=; b=T4TXXrG5mznvvHMuzsQsomR5dUgk9AJf6OyNfB
	lyAXpheWtmstCGBZNAxbj2C+VGa6lfxBrXGd9/l3UcELF6l68HODNctYtv3byaWy
	+jWc5pZRZhMUDpElISKE4V2kX3AG7R+ZbulbzftrfIQuh85PA0CgZTkDFKqkEqkw
	zZnLQR8WQacKpzTHzLS6HcO8WBS3qAlDArYMTDyn95VuXdnxCwAqk5i8M1rcmSH9
	b5vsEOX/v/WFa4Iiupx/aEDu1h5pz+1GdnEP107XJs0DDj1GWSl5Bj4RqYgGB46n
	UuTxNr2YZR1w3F6aSFLByd7I0VSU+7uT34o95OFghSV/YTkw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bhhyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 08:13:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3631225a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787818401; x=1788423201; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=id40phT/RVjPBVcSNSIiEAJtrrPWIXKWs4eDewBUW7Y=;
        b=TPyJXvUJFSuqZLYjtle5Avi+aaaB9QyiYnwnUaXAQmUvSis+ad69O9HRhA+XGeXrzS
         z9zZ38rlfaHAiQEPt0PzBLSanRMJwzy+3srd3ZuE6FKKEhwbDTEa/bDiVIHz8zhEiH8J
         u0pi+PqLd7rGaj60+Tnsd+Cgjb+C9dJZOFpnGB6zrzzF2C3rsf4z+8VHz055qzqWbZJz
         Y9rHUvZSe6/y0/hVsq9lkwQluTh5MpbmC1WU+AWA7iG25AbemovU0Y2ZSi2NBOEOTUva
         yClEdddDEUhhekS5dFrX2h8vMaT4WVLPD+JitjY47ldeDsXxsPI0Hif4++2vbL9XN7kL
         KCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818401; x=1788423201;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=id40phT/RVjPBVcSNSIiEAJtrrPWIXKWs4eDewBUW7Y=;
        b=pk4rtt/m+Qu7iaKc6vLM3Oi9fCS5TJaFsLKpYlgzXvUgMPAH+o3FSAVuGYlvuMLRA3
         9YApYAjy2gfbWz3mlKAs/RER/+g0vaSJQ2Oe1ctWxmVZatUMbhBfM4+7Jun7x78G8Cvz
         yLEzedJfQGVZuRje1NJ/J+UojrjhRwlUykcuRswpsR/wOoLT9vhYho19TRQ4fXecde2n
         1Yo5tQMk0Q4AYzbMPECzaVV7mpHDNkMOB6rHJcDOqNPh8rX8YYzIxrJo0Z7eDa7b7SI+
         c6rhH6Y7sKHmXBcNE3m9TB/pF0o8droUW9Xibf1uo6mTbiORmnlGHMCz3GZIXBbwToE7
         A1fQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzsG+lr/+jJSgnuwEvTlTOgPAViaaVC0zDP6+uWylKcP5b3xK5a180gqVmt+cAhdMFLJj1lh+7tCdKhwas@vger.kernel.org
X-Gm-Message-State: AFuF++mDm4qqGLRhV6Iuz8sbuekFMeEogh9NZm5PLcc6NgB4Xcxry12X
	KB5upBb3kLYdZ+WsIfB06+QF5NsYXFwhlfKX3VOTzmLqkyQKeJELgoxxzhrcLmPMCVrIbljJiKw
	xwA3eJYLl0nC+b+7NIUu/9gLDQMawYFHbdBdDMFDZE78SjrXJedMlK1w7Hzx002sABBBp
X-Gm-Gg: AR+sD12vbySZqsRqVC+sREuHyrLjlGt33jXwPJp5Kiaui82o5GR48JlIJOi8LCzs3PH
	6dyydq4tTx6SSwaS8jiBilXL3kj8aCCp8qdgQi5eJuTkLocB/9G+RMMonv0P4nDwDYP3h1akOUx
	9iqLW3uUN8nXXdav7zKbA2IzYHNLMiQWt3XDusOUNvEEDR1T65TpIBNfOXHDP+JRqYTWFFHXy6N
	sM7Ixpt8/D5V3pMJfOP78LSQBkpVMG5N47h6loXupBffJb9AH5/o35aAwBO/yMOf2KCcjR6KiA2
	pOLASO7yxEZ4M4OQt/b5ovh+KUgG/gCOXZ2DCZdukW7fBUA9FeH/7k2i79eWH0W7+tFXFG6TZ7z
	RDkskJXOtRKaThqn3ga06+l1kAVuWlvPfEUk3AcpEGdtvjZLjMg472VIbuXKd/QkB
X-Received: by 2002:a17:90b:2b4c:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3966d4592fdmr28943904a91.13.1787818401073;
        Thu, 27 Aug 2026 01:13:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4c:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3966d4592fdmr28943788a91.13.1787818400563;
        Thu, 27 Aug 2026 01:13:20 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm14214847c88.1.2026.08.27.01.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:13:20 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 01:13:17 -0700
Subject: [PATCH] soc: qcom: smem: fix 32-bit overflow in DDR frequency
 calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-glymur_dramc-v1-1-eba358d504b8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJzxj2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMz3fScytzSoviUosTcZF1T0zSzRANTA4vEVAMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAFiYxknAAAAA=
X-Change-ID: 20260826-glymur_dramc-55f6a0508ae0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787818399; l=3071;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=t8GjYgE6EMM19F6RxsbIprvmjnmTi3x/F720AMusbb0=;
 b=B0ErN2NGLU/2NSWGmZznEQYgJHMExgLbXLVYViJMztoFeovGlPkME0b0eHA3zk1LxFZKBmYJF
 rb8Y8wZvZoCBrsBElFQ6S68Vu8Hsw+UYy5O1szNAC29U6OjRJIENlRY
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA2NyBTYWx0ZWRfX15amda0lgaK1
 dHapCbdlgIQe/l/QDUEwOutbb5NuM3+dl6lzO0ISfxWG5vJ72Vn6H81tSve4cuhRZss7vDb5Fgi
 kiZ9D0SBTIKvXZlswr0KPoHhj2IN9UAkV4szTdv0z+6R6r2kvW68SkwuA8Bmopf4089yoo+WLt0
 f/R17tmHoQVoG5HMBXwWVQhzWcOBIfr30wGV2DD/UQh8p+Zkd3AUm8AOaRGCLv3Aau52TBE9FkF
 1tkT6Vx3c7TfvvNg66K6/OZ17guD8wBBa0cXdlUNEldkvcffYMzcjM74PvXW2jmlOiie9b/PEVx
 6xDQeKH9Ftf/7MxHLZSSsjwpsUVOK17wWIHfpNrfXQ/I4J14DGjBJ5mW9xzP78/o8IP4CiverLI
 oQY2NrRdraHk0HJ6u39tSe6dHclPt/Gh72wCS3hc3zcvnxyuU0QRj8Yo1YxZtVCP4JWxhkj3XY4
 gENy3P77raAQHvRV2bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA2NyBTYWx0ZWRfX8JHVSkoqXWME
 eCYfl2Rqem8/SN94hg8JPhYIv2YjS+b9ZSJOPA3QG4DYCdZ6/UIzosn6fEqyYimHPccxI3Rf+co
 +WIrZgX2XQCfCPGgooXNj7WUl1yq8kk=
X-Proofpoint-ORIG-GUID: T-_SitC4Tz7fy-6Zy3vMgYL2jWvDMR-i
X-Proofpoint-GUID: T-_SitC4Tz7fy-6Zy3vMgYL2jWvDMR-i
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a8ff1a2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y8tzQJoX9WwRSfPLOGYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270067

The DDR frequency in SMEM is reported in kHz and converted to Hz by
multiplying it by 1000. Since the SMEM frequency value is a u32, using
an unsuffixed integer constant causes the multiplication to be performed
with 32-bit arithmetic.

This overflows for DDR frequencies above 4294967 kHz, resulting in an
incorrect frequency being reported through the SMEM DRAM interface.

Use an unsigned long constant for the multiplication so the calculation
is performed with 64-bit arithmetic on the supported Qualcomm platforms.
Apply the fix consistently to the v3, v3.1, v4, v5, and v7 SMEM parsers.

Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/smem_dramc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 63ebe7f6db59..9612230a03be 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -219,7 +219,7 @@ static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data)
 
 		if (freq_entry->freq_khz && freq_entry->enabled) {
 			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;
 		}
 	}
 }
@@ -232,7 +232,7 @@ static void smem_dram_parse_v3_14freqs_data(struct smem_dram *dram, void *data)
 		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
 
 		if (freq_entry->freq_khz && freq_entry->enabled)
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_entry->freq_khz;
 	}
 }
 
@@ -248,7 +248,7 @@ static void smem_dram_parse_v4_data(struct smem_dram *dram, void *data)
 
 		if (freq_entry->freq_khz && freq_entry->enabled) {
 			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;
 		}
 	}
 }
@@ -265,7 +265,7 @@ static void smem_dram_parse_v5_data(struct smem_dram *dram, void *data)
 
 		if (freq_entry->freq_khz && freq_entry->enabled) {
 			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;
 		}
 	}
 }
@@ -282,7 +282,7 @@ static void smem_dram_parse_v7_data(struct smem_dram *dram, void *data)
 
 		if (freq_entry->freq_khz && freq_entry->enabled) {
 			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;
 		}
 	}
 }

---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260826-glymur_dramc-55f6a0508ae0

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


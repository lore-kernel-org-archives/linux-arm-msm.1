Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839E357CEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401752; cv=none; b=Sagux9PEuNaUjg0QcVU5DorIW+4Ydn68927qquw/JViGPs64y1HEt/kQEJ1Fk7PJ9ZbF8ae0UbiSYn65Ez/DBeu/aSdxa07cgyqiQ/neF/Uh98coQQjSZlNHS0WrC+XUTmE3e7ykEdo7jLJOvoAVDGgGXJPlunhfwjE4YYwRg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401752; c=relaxed/simple;
	bh=YSCzLQSB16uKcbe3+cGF2KdfW35CZ03t502Q8V6q/LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONvDQM8GVd9h3KzcVCOSiQ9mIruuqAnvEop2ZKEBwLRv1179rarV7f3+Eq0+XRF0X8REed941ucD4dC5Ib1AtS/vJx6SQ8r5lq67aBaqdo4s5fwfT/XHjAt01r1NfRZW7qh+CGSzlGp4/G1s1ZsCJa7T+Z36LnvLX4gNBPLGUrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8KQYvfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZhrvBbMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8KQYvfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZhrvBbMZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P4Zo1896453
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPhY8yd7nilzGQLPZJehSpMwbHwaeWfXH6IGdZHCFa0=; b=D8KQYvfUiGomP2vh
	1E77fvOYjhjovo6v7Bq98ClXgB4uOqnjTsPDOdrHftph6UYBzuPUPD6cker2nYcH
	sZK1qQMPRxWJ8xLeCHgs2qZ/YYCReKRggLsnwxL8QJ/L4NsgBBGDtvYa0REueiEY
	M4tp6vNPPrASIuFcvB08XU1frJyDqYdqOjBQivvdDpTIVCc8LyZMdz51LLdF9RaT
	570etR8Ruyq8diobA+wKbzaXeu6/Xx3DVhcT6rek/nM5C5qiZ83MyyXVCYaELnIF
	ZN8l/qkKU8Wv26frf1wboAcmCupB98O1HA4Fp8YqGZ5Rb6Eygy0NkT54KWYyRY4B
	ZXpV1Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr95pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:22:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso3319476eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401749; x=1793006549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPhY8yd7nilzGQLPZJehSpMwbHwaeWfXH6IGdZHCFa0=;
        b=ZhrvBbMZs9Ohv/ZhZRqyMGSK2y6DvHZ3gSB77Z/CR0L4Ua/Dj58vP9mES9UK6TM1/f
         WwyKzUPZyqnQ8PfNRLFhpHp5nMnOeJTWSmUGf4S9kIMylx5BxA+h4/kvapeZt+ccg8d6
         iY/mqzkCihPxlJnUPcEsglbxnqqusfDTlwXM8sfc6wvsVbBqTyjSyUMqk4T/fbDD4Yv+
         gbuJ6IPlKQlLmJWTQlnAvTOeSiu0VFJ8TLODk4iWLLwwkUwZwscIToelKb3SnggJdl7O
         atXiIrTqKOM88tSkCYww4pOXq7QEHh1/5wZwrlZaRV07txci5m2RC1Y8eHZEtr3PuTby
         VgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401749; x=1793006549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPhY8yd7nilzGQLPZJehSpMwbHwaeWfXH6IGdZHCFa0=;
        b=yKdnLSTkqd2iow4M/6bHCn4ccnN0dCashjAzs20bzD2RZtYK5YbNxlrKNKv5LR4xEi
         y8tkvAbsSuAAHAhzZPXdTCzLXkOzGytTJ3SuLaCiepJRQjXWbc0cNMwAMNHhiKUvL5jz
         E0D6jp/tXmFUrqIVUHQxRnYqwlsRhiEwzu6NN3LT/lCiA3Eahos3Igs9whASqFHFySwK
         g3LA2vJyMGgGOkd8crRNGr7Dt3ZvRoFb+e0BrSvazqMx7WwwSH7jWgHgVwaACyNkaClD
         cbjm8Rej2TmzO5DfNuPiy2V9cYM8mZQl7RsSejCVYiw81CA+V9UAM5HFuJl9sQikEedg
         9G2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+L8lfdOsAwT60EqhDHcS/EDu+yN2RhSRmTqNAySpJn2FttxojZubm1HvwjGrCY75Pktt0HJvCSJAwyMUa@vger.kernel.org
X-Gm-Message-State: AFq9FYJE52JUsoz663nnyvoqkmh0R98UBZY1jSFRb75p2h4zNQDvdKYV
	WxiDsHXByOCR/ukFXqQJ2UA1Q77mo6JVJqOx/MQDrLF+lw5T67e2at2DguGH1F7O3Me5GW9CGCs
	CJrkRjsGgp0p46yg+Ut+XgpAs1U36DnaOx4GlN4eoMTvxPQGU0thdYGKUrUHrZScuZUnD
X-Gm-Gg: AYBFou2WKo+vokX4rd++Oe1vKU7qUj3RESMAAp9SNydZG+jsY/vT+NFS5SWqwa2fjCN
	BkDqCODM0/qUeqPZu8+jJMRDFL3HyXaJOcV/Js7GibSx2/GTZnZhg7yLT28LWfMfKnXVf4oJjlS
	oMk2yvHIvose6zxKqBo314XlegUgiKjKDTuyFKw3Uh12pxIlh+y6LByxHWN3py4RIgnrvDvOww6
	AyanGq+UagI54HkMdMKiJEU1iqqelDGM2ojaHcoqOnE7MO7qOWlXDwMfaRywT2SfFiTYSQgydNv
	m52vf4LYxqfmrD5KDRR/DfqMWDk/3tWtZ69XpKXvwrC25LOpJfnNn28oePfXmtii+01Dm4q/Lb3
	pgf5799cQUh5AlHxSy81YARC10taIzq47
X-Received: by 2002:a05:693c:6395:10b0:35d:b44:a52 with SMTP id 5a478bee46e88-361a23528d5mr10797485eec.24.1792401748778;
        Mon, 19 Oct 2026 02:22:28 -0700 (PDT)
X-Received: by 2002:a05:693c:6395:10b0:35d:b44:a52 with SMTP id 5a478bee46e88-361a23528d5mr10797467eec.24.1792401748285;
        Mon, 19 Oct 2026 02:22:28 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm56225094eec.24.2026.10.19.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:22:27 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:51:48 +0530
Subject: [PATCH v4 3/3] MAINTAINERS: Add Qualcomm TPM driver entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-tpm_qcom_driver-v4-3-6889b9804ba7@oss.qualcomm.com>
References: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
In-Reply-To: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX7CNjgC1X4YQd
 oDn66JerDhytG5iwMF8ZIxqs31JczPcM6H3sgIAhhvmN0sLo9tn0AbikbKsS0dUbSmla5Cp1NIg
 PmkoiLMSnMiCKmPu+jLDOl+g12/VEplKlKnzTqCRBI9KO44SP0HvxlCrFdK2ELkEgCRT87Vgn9i
 CIaIN7nOBV8pNS2EhEr6lznCN9B/gaSQL9+TbkeTm+IKKRH4RFFAMXSiMVVYpPWn9476o4o293+
 Bx/siSzoMNjP3RfrHSD3p24gWypGJEYUIWaDrC14O/+lMF4HqvoplqzpK2zhNn+XS/qFMW/YKCz
 E/5dJLZeuuF60+aldIIQXTv8PNM7SfVBRUu+PeIX/yGpC2ejSXcBI8iz/GdQ6f0m1w7NdZfvLh7
 xW94PNbXB5tMf+AWSzQvZrcnN0IqQOOu5GOaoNLzkH9Eq/f/xfvwrLDRD/n4e2OQTQ88rpD2QEX
 8NkMCMqZHQFsww/bW5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX5SXp7btV1FtQ
 BLd7hy6Qjmr95E8SJAzjIJZz1uL+mVT6D8KNwyJZHXP/Vzv/DcindNndFd0ZuPJ3BoOQi4G25J9
 /XDq8D12HD0vmLiFcc78w8XkjXC9mqQ=
X-Proofpoint-GUID: _aX6Xjszjr9U1K9_uzVaWGzlEMklV6xv
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5e155 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tHMf5gnvwFDjO4kcr9MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: _aX6Xjszjr9U1K9_uzVaWGzlEMklV6xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

Add a dedicated MAINTAINERS entry for the Qualcomm TPM driver, which
uses the Qualcomm TEE interface (qcomtee) to communicate with a TPM
Trusted Application running in TrustZone.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb43b8e46158..bb86a7c024e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23160,6 +23160,12 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM TPM DRIVER
+M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/char/tpm/tpm_qcom.c
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1


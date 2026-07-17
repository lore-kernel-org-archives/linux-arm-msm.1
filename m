Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A48636C588
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303639; cv=none; b=nj8zfe61vQc/xElcD8vwhQuwP6XK6vLwQIFasKQ9QjsUTau/y4v5phyENoTrZ3x2T6i0FoXGEcZaq2QBLMMhGd1355IwsSMtwyzMtLnooN0/o/RGCHH6glO3sfOOd94sKJZ7oER0iAImYyBkLU5HQi5EJG18LI1u53yM/SM1QSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303639; c=relaxed/simple;
	bh=oGFvnXA5a4ylqmmPPN4yif8ivxnHqLZzKhvErrv6UGU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DM6jnEq7teyR4+tphqVOXwGx0YH6Q+LDqOgwf/q+Tr6ul6CvazupEp+pEUNTnBmYukWIwnQ0bmNtlY+Wg1alYx1+1aon4Z0sSQItSJL2IX/0r0aJRhR+W1caq1dqtlzInRm64GT08eBENxISY0P53+GgEaSUGlErCfmyLaGRstM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4xroaRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSGlvhiZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4xroaRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSGlvhiZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7wO81839042
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uszRWZ0TknZkXby9p6KApt
	6G+IQIHzRbg+DPrnn7O3o=; b=i4xroaRh6s7SGSNPcgd4OL+mlrf3I2Hc+cejk5
	xL3ldyyLXeLEQCBkcV4gPGtZhJpvzbpjmdvIYP6NuGhRnPWL0UxDotipcHhar4CJ
	RKwLYoXvWHA46KgkdxXgcHnmqjNR/t4+QZT7shaTtQUfz1Wvg+7HZU04q7DHV9hb
	g1OPLmHYBbKvx+l1CSKU4IcDTdAdXAgyzYQLtRI+wLX1e7qWHmbduHtktMi8nKA0
	9f//Y4sOXjs9CAKwqUPbpktXdjwDNRD17dkoC4ilNu0/0SanYQpXqbbzeJTO1RZk
	/OkeGJ44kBI/dW6kjLDdzOOG22zrjAcO79MsY2Z5pl8AmZEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffaga246-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:53:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso94256161cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784303635; x=1784908435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uszRWZ0TknZkXby9p6KApt6G+IQIHzRbg+DPrnn7O3o=;
        b=HSGlvhiZ0Rvu+AK24EV7rCdz8MyOUDJWi2NT5Hhifm9Qp5JjzjsDlvhqGmVhiwaCSY
         y26XvTeV83Mqp8pxmz7nG/kqhZtDil+SRV2w3qcBEi6aJf+bSM1Hh5Or7HrOXebfWXS5
         emUOKtnM6UvI6vFFfYClgxdTa95J50aTvoE7CLxOodFOWd2J+C11fhtKla+a3X6CO01h
         qA36Nd/WSWMzCVeSj5u2+iK2jzCTq43kKEZOhKxqOrzReuEexWR2wEzQg8PsgqRmJMY7
         E1L5dwK5uxqPMveG0kWuGw6885p4pftbWLegMx+A+06wam0SKE1WbpfMPiuIMCamfvlv
         cOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303635; x=1784908435;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uszRWZ0TknZkXby9p6KApt6G+IQIHzRbg+DPrnn7O3o=;
        b=abTllOn8s8unIqxrPJMI0p5kmBRA/DSroxfG7KqGgpurLGGY4ve5K8uWqdrX7PEBYJ
         6pDdZ7sszQngYciV1YcSsQzPi6t6uLRb9V3Cj4YLJt3gKNUx4xtFB7JpCpLNb71Ujdoq
         eNZ3y7N5LxwenV9wdqG9eJ+J4qD73QEViDlmFPuiAcW8BhSKy5YtC3S+Kuok1NV40EdP
         FgjUGVghYzTFQvvjz5/zbLbIs6729qILiYU3BJl1+z2P2Yt82wlZDRvNGcibRJYjUyaF
         pL0ko3FDURx5gXbDIjmQ7hSUyocflrmtoDwqNzI/Jd2SwiskzizWW0o1qbhc4SWZK8WF
         164Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro7D1kXd5Zn5uv1zEdQxk5qvptWuUG8KmNpah2qAGQ8oAJ1TVhc7+ca0GLEIixRzo1fglczd9NiqBPUO8X1@vger.kernel.org
X-Gm-Message-State: AOJu0YzW8eLOCYW+ZDBVrtv4RDJyzyfYhPQD5jEJX/jTrcOPdaylSIeo
	sJBUEPBG9ZKln6OYhG9BU/NQYN9HYHkhWamKLwg9ZYTNz/iXAF6EXFokmSaaDWXfWk19UMYdaMe
	d7KxyilflZ8Uevs5CcneFuSGcfepHPyOt4SXln37CPoRlxcbY2ahmdTidQoGsXbw9zzhs
X-Gm-Gg: AfdE7clzflLkTSfIHRwiwYo+xhiPTZmLASbQiLLiR1kdQav48KeUkuNLlEG05XYXK2x
	24FDeAC6l639AXSjf23nJbn6XVMaobTHXsgF14N8yMdr1w2NKxwqrPcubRMrfnWguUXxXjIHtMq
	mHlPTXL0UaYkjQLis/r3pE+FOPDiuexfD/oHce7nGBcLPXSDZkhIPZcXzkV13KZwQDSNoBlQWqq
	Y7FwHtU1BhUxCDRPxy9PRSTSXZMyw/xVHWbOPR1RT5Z+D7PNWmnwKcVDc5WixA2HbTrQ5xudf+N
	6W8JKfB5sg8HyGi55oPjGP08wMfDghcwpGkz2y9suOMYkC48C7W3BpXvAopP3StdVK4VAs/owm2
	XeT+/ngrauWU60aLTnLrLcVsojEFcLQ==
X-Received: by 2002:ac8:5dd1:0:b0:51c:22c5:daf5 with SMTP id d75a77b69052e-5213de89ca9mr30458511cf.38.1784303635233;
        Fri, 17 Jul 2026 08:53:55 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:51c:22c5:daf5 with SMTP id d75a77b69052e-5213de89ca9mr30458001cf.38.1784303634683;
        Fri, 17 Jul 2026 08:53:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2511sm47057095e9.1.2026.07.17.08.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:53:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/8] crypto: qce - Fix crypto self-test failures
Date: Fri, 17 Jul 2026 17:53:29 +0200
Message-Id: <20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpPWmoC/3XPwW7CMAwG4FdBOS8oMUnactp7TByyxB6RgNK6V
 CDUd59BmsYhXCz9lv1ZvivGsSCr7equRpwLl/4kIXysVNrH0w/qkiUrMBBMsEYPCTWVq2Y8kJ6
 QJ9auA6IMSJ33ShbPI8rEE/3aSd4Xnvrx9rwxw6P7x/kaN4M2OqfOWrIxZgefPfN6uMRD6o/Ht
 RT1UOfNq9RUpY1ImBJ8u4w5UX4juRcJoCo5kRy18mhsbEjhjeT/pcaEquRFagO5YIlsC11FWpb
 lF/DQFRSZAQAA
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3101;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oGFvnXA5a4ylqmmPPN4yif8ivxnHqLZzKhvErrv6UGU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWlAA+iwlncAoWZ/ziWeUFWMrFClphmIokmWDt
 Cy5WilKvPqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalpQAAAKCRAFnS7L/zaE
 w8F4D/9jfMFbvMy4RQOZY1gDQOU4LuPxrwiUgow8C7+laO2IMxncNSRqjhv1Oc1Wid2Y2b8zLha
 vY4BGB3Js2zp0CJ9wQO/dMCfI4tb15JhD1CEWMFRo57B0DqB2BGDBh9/ofw7nRURr+QDbuD5Oka
 8La197F6GaM7/z5YEZEccWBW7WcnimV9HNnwJ19tdcWViLNAg1aXcqnFZiap1ytGneuk/ptZnYH
 U2q66Fq/zSVV1m+Of31qwY2O8b3I0gxwDIh1HO5RDDjA1m38tvAjHkBHgMGfggU14weqm2oBmlh
 owPwGEJbxtbruKTh90an9NtRQF5AAXGDx0P1yQQxuB/zbMo/HgpI0GbaFXyzS/J+nJ3QsyUl/7b
 0dBF2gp/JbqBiURTLLLL2LG1zbSlKjUuBWeEbHAbXYNn6DA2cXPV+Kk3g8w5kWznfNm9Vf46GdI
 oW1U4UUYrdVcZSxeW7CYGR2kQcDiWbTI0bQE3Lcv/rKyQZ+GjkQiazm6Adw4QR1UEAJm3HFcRs5
 c0o2uzDAXgnYqVo9cP93WyGroefKENLmVFxzwnoTsJ+9PpU2qaLKRd3z3hFv2QQlTLey1E0uxrC
 b4VKuGvUo7L0ZBIKbxR+UFLroxztggV9LdgCalH0W6pItvq6/NeJ3M9oku1n8hIsSpdrPFKR+6q
 TXPb6oW8zXd2nBw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2MiBTYWx0ZWRfX3C4PJDq2ifmR
 ebI2u0NAh7UjF6xyp/wRXjeO61CsKAn9itjghWGs75MxguBnzp1bau0YUNrurP3TDyboaUk8rER
 s7ICdZvTkKDL1X3dX4jGHB9aoXmAo711X9x2ZubrnKNonfkQbUXatUCRQZG+lwefi1aYlSIIHUs
 SsXBR05pW4u4M4IrcqjypJ3+OBcn6rwZoskrpmSAdi4cixXaYhU2aijqcGiP0oaGW9JEmoUUrbg
 sjvoVmZQqZyerAwoM1qinVEpMPBBM5VZL03PfBcnR2/N1Iri0d8mdge5a5A1DnQI9a/twSV2E+I
 8BsYf+meJJotj+sQWDg5ghcggHB2tZ+P8j2AgCbqCWoAHLONwzZe/m8zobonfBYzs4Yk2MOawdQ
 1z64do3iJ/zE3FOerGRet8kKixwfkJ5YdQsCe5MOwlcAeCmBhPxD8TZhbYYNcwwb+f9FKfGEvYw
 XrsjzDX7a/zSgEduIXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2MiBTYWx0ZWRfX8+rybmhAPjxF
 YQZZ5hYMILaPIraGokyIXtdgYNtq0RwvoVI27hQLG4qVQjaIfCrsndgkLhxUqgk92C+dZvCUoPk
 SIbuqj8CCg5+9XgIlGDXObzzFQXnT6Q=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a5014 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=p1cB-73YWAyPVz0D3agA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: j3ydQl-wwj2WJ5EbiO5iiDpb7Bnw2ToW
X-Proofpoint-ORIG-GUID: j3ydQl-wwj2WJ5EbiO5iiDpb7Bnw2ToW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170162

This extends the initial submission from Kuldeep.

The QCE hardware crypto engine has several limitations that cause it to
produce incorrect results or stall on certain inputs. This series fixes
several bugs and adds workaround allowing the deiver to pass crypto
self-tests.

The failures addressed are:

- HMAC self-test failures for empty messages
- AES-XTS returning success on zero-length input (should be -EINVAL)
- AES-CTR: partial final block causes the engine to stall, output IV
  derivation was incorrect
- AES-XTS with key1 == key2 is not supported by the CE
- AES-CCM: partial final block and fragmented payload both stall the
  engine

All fixes were tested on an SM8650 QRD board with
CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Handle all zero-length HMAC finalizations (like imported state with
  data already hashed), not only the genuinely empty message case
- Add an additional patch addressing the fragmented skcipher payload
  issue
- Link to v5: https://patch.msgid.link/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com

Changes in v5:
- Dropped patch 1/8 that's already queued
- Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
- Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com

Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (6):
      crypto: qce - Fix HMAC self-test failures for empty messages
      crypto: qce - Reject empty messages for AES-XTS
      crypto: qce - Use a fallback for AES-CTR with a partial final block
      crypto: qce - Use fallback for fragmented skcipher payloads
      crypto: qce - Use a fallback for CCM with a partial final block
      crypto: qce - Use fallback for CCM with a fragmented payload

Kuldeep Singh (2):
      crypto: qce - Fix CTR-AES for partial block requests
      crypto: qce - Fix xts-aes-qce for weak keys

 drivers/crypto/qce/aead.c     | 32 +++++++++++++++++++++++-
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/common.h   |  1 -
 drivers/crypto/qce/sha.c      | 58 ++++++++++++++++++++++++++++++++-----------
 drivers/crypto/qce/skcipher.c | 50 ++++++++++++++++++++++++++++++-------
 5 files changed, 116 insertions(+), 26 deletions(-)
---
base-commit: f6fa674bd75f9ed0e74f4ca85f88a6e461b5f230
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


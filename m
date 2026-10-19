Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43695960BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421199; cv=none; b=iEdprHDZpRztHdvRQn9VEYtOCH3OqUgIgejlaANHGAeYStzl7OGALgEeCxoQA7d6NcB/1nfWylA1E+H/2nSw+nPiYKxyWhUyeQPyqHm9I5CM8kJsez593w1VSBPx8ckdhQkUFSc09KsSBihzsCb1b2KYi+g87tKQFTKfaIrgZnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421199; c=relaxed/simple;
	bh=THrDHWFhxEtoPF2vwxzXrodQOhsqG8BbvxDGAIjCE1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZxogRdykJtPY2vFRMQkBf7o5krS1F6314p/qOpPGHe+vRCGoIsEvXtlSlDNnveK5ZW1shjkQICr/FvjnpOoHPc1iEx/0kjJuQ1FMxRqhQzZzCuCk633P2Rgc2dX0sPvzl2imGa2qemzrfs1q/+M3or11DNv3R/z6hOKebjXt7co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkXnvTHQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWbR4Ep6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkXnvTHQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWbR4Ep6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0ZhW2401860
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3R4Uxv+RXQqX+e54UT3COG
	5uoz+brqQylBzzl3y/JKo=; b=ZkXnvTHQuh519y+T0hhfEtlg1TlUu5DJMD49sp
	tk5/qWOoPmEATUdX17e6aVQtoJXcpE6DDPoJfrQgcAqKdx7ozlVrR05m9OsQCIof
	W5IHdDV2audY52oReJ6NC6dp/iYVmYatMXUoBWNgx0dwBfrA19tPCUFi96C/A9pv
	6osjkCkbFsKP+eDAMfL/unr5OYlFBogyyNzEF9DKtUjtos5qMc3v/K4+OwDf4DAI
	tpRKiHIhTwE9zSkh1dnSOA+Em6Zv0ntLBDOHN3Z6n+fugtbutoibGv7VqAmLXas6
	WuCMFARIuaP2rkDokOvkSVisBUAZ7lGB5Tc88snrbZQbutng==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n1qe7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:46:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso639831137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421190; x=1793025990; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3R4Uxv+RXQqX+e54UT3COG5uoz+brqQylBzzl3y/JKo=;
        b=KWbR4Ep67s0YpeaCVfazlaK0zn67+Z06LskiwRkQ2BNtqabVcpqtbPXo6SbElVLCfA
         tEKDd6vhJ6V8Dv8OuFTQNSyyt7qN1/8Geu4gu2LibIOR4gkUByw8IJvm7NIesa79tY1t
         seQfiG+mgjgcj+zvTT4Vsvlwxqc15+1punn1i4zExV4Hlkv/I8fr+4wQXl95+aogpGSb
         yxw1vzxB6vmhNyI1qWRgdqbgDbw2hUVb6mL6WL2sh4JqnkYMjh6Z7crnHexw+O8NQTVo
         lqrAHL341lwWeK0sxneNNvdyMm0kcFXHkkpygE2MlGPFCIPPstQ++bs+D/JNwo77Hjnk
         vDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421190; x=1793025990;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3R4Uxv+RXQqX+e54UT3COG5uoz+brqQylBzzl3y/JKo=;
        b=ltuO3B0glgFXxMBAn+8poBPaoXOl1EkiwPNdHpCZ8NM0mYaA4PBhzLzrh8xzXRbCzl
         /k1R61SImIVzR1jQedaDZS1mkMjhKP9DyLzTOObJ2XJOrsNr+Fb7niC+Dev9b9OmtBrm
         Fl+6DSG9zMWANDg7hzyL/+9KVh4jf4DIlcMj7OlLWmfv7WmImlpfi2u6z0Yu948VlVx2
         s/XfTHQ24IZkIH3+8wkE8GR92FRT44sRE/8GMS4yXykFjtUO6Vs2BqN4GCoAAgJSudJG
         T2QFktR0N4d49n/Rb+aDEmJJM8EwzBGEdyDMre17Wb4G9M1gJWcwTO+T0Oz3YJ/IWDzQ
         Ckvg==
X-Forwarded-Encrypted: i=1; AKwUvBwlf+Ml6NZ9TkDkKZ8+BomrV/ChAu/lDo6PZFCFWZ3YSxXxMQO7AUjSJyS1VAwZ5Mq61IlS1hN9Mwn+LP9Y@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4fgmj6hDJss9/JRXDpOq59mjBRCch9dGbJv5yf/X5V0aHKhLc
	b+1JdAzNtirz2jTZk7lWP6Krsog8CHP2Ez5PI4SYG0ubNTPJ0IF+aJt2wI6jUb+kfa0ANgfw4Bd
	JOXP3W22yk8sjV6fsCfd8yAZTDK9tyZAYdw4jlwchRBvnPDRwt4GLl+v+HRaWjbRoYjTi
X-Gm-Gg: AYBFou3l18yTzzRmgU1GANXsAj8cf1DyPHv3htJThsdVJWlahyQbw9TzQ80IUjmm9Ro
	J8C+OmnOT34y4TgGh8En5dpF71qe9NSifhGviM6XQ0iFy6NVMBrpinQ+UTeqs1HxrqMj3F+AKNi
	RF83prL6lAtd6VlpuZRBVwl3W3sNmfa9xj66wmU++jSt/gKl+Xkv2vOfbIfDNkx7AOYRcxQYRZN
	NgKKuBe9EIG2YbFnrhqgJG/sYq4eY6lhPV9ExDWhZtzo5OZ5tfmxMHSMEbNtudQMWD44WEhlJU/
	zW1NdP/gK5cMVIsPUaggY4ou2MXDmDXXBjlZAeBc8l7GVVWrNrUtMm8Xk5JgYLfP/OkOj4retSa
	w+9MID7YQGKxwwjj0HoEQjrFM8+uh
X-Received: by 2002:a05:6102:e06:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7cc3691d214mr1863868137.6.1792421190181;
        Mon, 19 Oct 2026 07:46:30 -0700 (PDT)
X-Received: by 2002:a05:6102:e06:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7cc3691d214mr1863847137.6.1792421189643;
        Mon, 19 Oct 2026 07:46:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e7657d4dsm98504635e9.2.2026.10.19.07.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:46:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v12 0/4] crypto: qce - fix self-test issues in skcipher
Date: Mon, 19 Oct 2026 16:46:04 +0200
Message-Id: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACwt1moC/32NwQ6CMBBEf4Xs2SVtgUY9+R+GQ9MuslEodJVoC
 P9u5QO8TDKTNzMrCCUmgXOxQqKFheOYjTaHAnzvxhshhxyAUcZqpS3OnrDjNwnK3fPUU0JS1bF
 2tlFkGsjFKdFO5N61zb5necb02U8WrX/x373MoMKgqxA6surk6ksUKeeXe/g4DGUWaLdt+wJMi
 NW9vgAAAA==
X-Change-ID: 20261016-qce-fixes-skcipher-e0384a650e25
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4200;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=THrDHWFhxEtoPF2vwxzXrodQOhsqG8BbvxDGAIjCE1Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1i0xW4BX3Ny7+NbCBHEaZVfEG5T4ToVMyqTNa
 Hf1DuND4WqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYtMQAKCRAFnS7L/zaE
 w0t4D/wNXmhYy7Wp/qW26on8wIuVcWliL8oPAbp78pyinOXSNKJwLKqESoY/mqfYLEJyz8c74RV
 gcH3KJEZcZjbF4mPLLqt4HXgpBwFLySB5HHbKEV/2YfPU3ItZSXc311c8uKv1RQWUNs0bQBshb7
 4pQE973FuxbuRyh38FMPA859WbpJS6QiNAHmY6Vao00GnncEyYXdwz8ssCea5wjXr5iDiU4XyXx
 m9Cgr8edCgHaI8xUivEpsdGD7AsVZWnC2HhqhAp67n3FRVxKRnhznwWzMwX0cRoBSTYRYRYOd85
 qxqKV6UeEO/j0/fBxrGcqIX9q11DOco7katfLnJgCGyO0it64jN0JJ31Erv0+iQkWfwqGwcyQD4
 ejzEIniOb7CzbIRqRptUOn4UyojriJWMBz3fdZRJObIpwNvjs+FBBdzVAVlBFyxCxpSxUyarihH
 Gnd370No43ptz9PLGi84+xoZ8WarrQTBDdJvN5MFbdCdDra+eZIpJRtlfmF9ZZAHnUXHfOWNS5p
 0ouZYuU+z4KCShIJty/MxM2CjuruO4sn32NOgqdNOwZg+wvScup6Sbmj8lNJjp5z1Ol+Ub/5xCq
 HhqIsFXXPaDewnwWgFyh1dX2n+lkzyoOKDBERFe3wtpnHT6PeXYPabrBZx2AwgwFB7eFeHTZUTU
 EH7KYdFStuFwuFQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX+gEOg1si7w/x
 beifNDssoSUl8fsO/Rvtsh+zGLY+L3Qx0yE0Q/2/L8i+Lm9KoRixmg3HICFstn3Ay1s4GKH11Or
 asnXQn5ggrLPleFtGc7BSPUTmat0Ris=
X-Proofpoint-ORIG-GUID: BmSHv0ML5g1bxNnnAp78NiIm4waMTZeP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX4drhh4lCHcwC
 OelIx6c3Yh4uSkdtA/NpyI3Mwd5L6cOHoSLhibVVk5UX0XhnuxH/McxRvoOfavdZpC65BGorpye
 /ikbDt0xK2UNKZiGgK3IhMC93gYfyTBJFwuv3TuzhO/l4qrwKiBVOwyZlyY8DQgKXfvnHSSC2o3
 WBMeReZIrCW0C3I8tNDVx+2owzsRkbiYK6ap39ECn59yrhjv90rgeh1xuUmaQrsX4hF/2OnQmTl
 R/yVK0Y9zoNZ4+xXnxdnga3IP0u3a5+ZpvpNteNKNhgZLEZWZGtCJi1jXsVCNnZPJXpDPv741UI
 XTNC4UqV1U1ZKFc92aWWiLkhZ2A+YV6rxuc/u9keKvtgLdVdefeORL/hK1gSYS7+5o+LERDYbtl
 WQd9Cf+K6V7PykVPyKObcvPSxfKxNw==
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad62d47 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=9V_34UpJrwX9EJPKeM4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: BmSHv0ML5g1bxNnnAp78NiIm4waMTZeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610190058

This iteration will hopefully fix the final remaining comment from
sashiko.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v12:
- Also reject messages shorter than a full block for AES-XTS
- Link to v11: https://patch.msgid.link/20261016-qce-fixes-skcipher-v11-0-d13ddfe609a4@oss.qualcomm.com

Changes in v11:
- Split out the skcipher patches into a smaller series for easier review
- Drop patch "crypto: qce - Fix CTR-AES for partial block requests" as a
  subsequent commit makes this adjustment effectively dead code
- Fix a mid-series build failure due to an earlier bad rebase
- Link to v10: https://patch.msgid.link/20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com

Changes in v10:
- don't pass a NULL buffer to sg_init_one()
- fix byte order of the imported hash state on empty finalization
- don't recompute the CTR counter in software for every request
- reject skcipher requests with a too short scatterlist
- check fragmentation for empty CCM decryption requests too
- don't use a static loop iterator (duh...)
- initialize the return value in qce_handle_queue()
- Link to v9: https://patch.msgid.link/20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com

Changes in v9:
- Rebase on top of cryptodev/master
- Rephrase Kconfig help text changes
- Link to v8: https://patch.msgid.link/20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com

Changes in v8:
- Add a patch making the crypto driver *not* register algos by default
  but only if the user explicitly requests it with the provided module
  parameter
- Use the "offloader" name for the crypto IP instead of "accelerator"
- Fix device module table issues
- Make the core driver use a list (despite it only having a single
  member now) of child auxiliary devices to register to make it clear we
  have the intention of extending this once we start the work on secure
  media playback
- Link to v7: https://patch.msgid.link/20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com

Changes in v7:
- Add follow-up changes converting the QCE crypto driver to auxiliary
  bus, adding the core QCE driver under drivers/soc/ registering the
  auxiliary device and removing the BROKEN Kconfig label
- Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com

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
Bartosz Golaszewski (3):
      crypto: qce - Reject messages shorter than a block for AES-XTS
      crypto: qce - Use a fallback for AES-CTR with a partial final block
      crypto: qce - Use fallback for fragmented skcipher payloads

Kuldeep Singh (1):
      crypto: qce - Fix xts-aes-qce for weak keys

 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 41 +++++++++++++++++++++++++++++++++--------
 2 files changed, 34 insertions(+), 8 deletions(-)
---
base-commit: f0f20b900bbb8bdcfaf6cb282787854067d8eec8
change-id: 20261016-qce-fixes-skcipher-e0384a650e25

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


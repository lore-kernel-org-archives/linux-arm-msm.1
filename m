Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659495;
	b=z/ly5fqnFBdigAp5sHR9AraxDrF/vGXzgeHi2j5ZEeRtEGP/VZVqNWTveyOZdpI+6Vr5
	 M6Dj9e8DPwWeyjjfy+/l6ka/8eQ5hCNZ3hkv9TxC7gHNPSlGDtWAtpdr7sqwvwWU3rtAw
	 nRzP6XHvMkqM7YSv5PAu9JeShO7UIHkhS/z+cqlJdvtp73Sc0y3ikroIcqLAfeOwj6cPq
	 WPajLoNFSws1pKLRVRtBb7gj6M92RjNTMftzgNJFhjZT9K6Qk+vRcHaRbLX9hGeNrvDRH
	 QE5YmCfVa1T+dvbfPUQ1y8Glr7+tbAIJmeocfQys7U9Iat6wcbD+ysCUSCloCbfQptQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QO527nYtTVDs90AOOrllvHVE3JmeqiYYasfYAtNl0pA=;
	b=1s2C9lSC9zBgMA+wq6mET5KMlEWD870ePe0f0pIcOYOcxlYTAsG5W8BeDd2blFjMRloR
	 hpcd514ihlDAoaUwYjD/Au+DOuPhQR73toOapHpBNJrN7IcwCsRcI2giwJvmOClIfI7B1
	 giwDNJt9ivSXIIWJS3xgt1M3sMK2KXijLKqRY+xJ2T1Yocp56FzpIM/8w1wi7UPoUUJtN
	 XY/TKNfSpmjgaDKUs9CV4IU2lXCnFM/1m32lFN8pvs4aIfCSunBE92UIKaWFoy4jPHkrW
	 ilcXdWknWMZMMqCA4MIfdG1K+iobuYND3w/gHOMvoWX2qc2j8s77Kv6Rwn+ihP91ctQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OU2u0yMc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZJtDvPz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6A9606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OU2u0yMc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZJtDvPz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701Q83076321
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QO527nYtTVDs90AOOrllvH
	VE3JmeqiYYasfYAtNl0pA=; b=OU2u0yMcCjXeVr2aEGKLhp0GG9aqjJVIIykiyB
	268zsJMc4AOwDkgLypGfRIeLJsgBKna5yk6GwDPHTj4IHY0pTBmeUqMaV/8ykn1E
	nnhvj7+mhfb2cd1QqYZ6iVYfytN26RwqfhreReiK8u8+daj9nGWem3BMF/4hKVKC
	o9xm3wUsM3qh4BCICNkWEpaffCLturelqpHKNefmyNi1bJ9QOSrqFdkKvJHWlIpL
	CvyV9qY0VLiSTuMIWt2byRg9XrXcYddEX00OPop72W6DiKQJ+mEnb+k+KCrMNxSa
	AWxABMpl8xFfjkFM+Bz1d18L01aTxt24K4vIhD4jeyb6G8gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1j7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:58:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso131950385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659492; x=1793264292; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QO527nYtTVDs90AOOrllvHVE3JmeqiYYasfYAtNl0pA=;
        b=XZJtDvPzYzdVoujf/4Q0UREwX2RComHAt056FtoDn3zSy4YvcWeDps4HixvQyLN8uT
         q+ZhtaMhuHpCpyKaiEaY5GvNWPsG1ST9O1BKHFMhSk1I2aLpVReryXFtXBzfPCbBJag/
         ++GxV8gipNmBBeNArqkvU6FaeccVqzkyXJAr8JJrSq8Bd5vH+oUAzPbh+58DQJZRGOnU
         44V7Xo4K8ZyP7601r44iqzA0xLxCi/ABI+KQiU5wy9msd/XfBRdw6cxdvzD0QDzFCbwg
         u62RN3eK8IwJZYJRDLP8jqz0UNUmekztvNLLmXNqhtivjHplaGRbC87l2txkixvitN9k
         S9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659492; x=1793264292;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QO527nYtTVDs90AOOrllvHVE3JmeqiYYasfYAtNl0pA=;
        b=gl+qUhs+JHNJqGknok4mVF3cptSjVGP/jSC83nHj9L7UvCo/KG4+V2/HhHghkUugVH
         upL+EYWuLMiZQGYFqhxBXrUnJLMVPnMjjoly/dQ9k/IM6Vsl3y3c/7sZD5TIITX91lw0
         vU/L6ea50LD6PBghKymWLCvkTBSmTjY0e19r00aGcAwS9qfxnFetmoD/nURWupaHEHLl
         PnKUDp42cVzX5tspNOplYpyKuaZxKOC0pT0rpPjfYfcoiSHVXfMfk7r0lnMCSRWgMyiA
         3Yrzl+nEujdZqP4i0MHwODr5nURaF4eL9c+h08s1NPTDjStPuEeCi8qKmDmuczBFGN/p
         xJSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwUXZgkVf0fuifTGxkyBdk5ITTYimCuM/NYmLsijgPpFlcuel9om9P0/E+9xBCM1ZdFshV8SoOLDQGnTY8@vger.kernel.org
X-Gm-Message-State: AFq9FYLeJR1BlPWmdd3xtZHZLggl6oBb8cEtwcIdVJWQbGDR3ew9owCb
	SM7AkEie5i6/itOBQBLuMVbUqVoWAr8pQP2U40cZ5CIN9pSROT+ehsXTRt8l3WQvjXyLh1gU7D6
	VY8H/gduwl237X4ygKLb6icoWK02iRfGrFUeAAQbdMOUQwMY4AkvBTJF7dtand3wC4HyUYalNp0
	+D
X-Gm-Gg: AYBFou26cSJRBObZnUPddRcoI6n7aeZnEFfRGfrnOjvzEa8ld9VlLkz0aSxCrBfWRBh
	EMDQ3pYJKiPFWyItU1rrRWgx5mCPi6tYeEBirWh2JyAstYyEtui5OQBDXozWXPynURAUQ93n0xT
	df8JHhQ31oLexeqY5dXROF4ot+k9AaOF4O0TUge5StRDaeQV1izMDCVjTycUfbi8F2ldoQ4maSf
	QuYzPlTqqz5aZTnb3XkqEYJGWxwcbKu2B9mNQx+4SbtQ7JuiS+1wcRzGeIVRghiiXQ51hUPWGr7
	51wdeigQ88FgYQ3rx2flmjXGQPOHrAXw1179fkN+JAJgR29AXaa5EGU158W6hZSSW3O1RJJRfX2
	tiAq0nJVHTQprSrCcgov95pgDtmc2
X-Received: by 2002:a05:620a:1a26:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93f62720fabmr279113585a.17.1792659492392;
        Thu, 22 Oct 2026 01:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a26:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93f62720fabmr279110985a.17.1792659491909;
        Thu, 22 Oct 2026 01:58:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm61625525e9.4.2026.10.22.01.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:58:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 0/2] crypto - qce: make algos optional and remove the
 BROKEN label
Date: Thu, 22 Oct 2026 10:57:58 +0200
Message-Id: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABbQ2WoC/42OzWrDMBCEX8Xo3A2SLMt2KKXvUXJYybu1iH9iK
 QmFkHevEvfgQwu9LMyw883cRKIYKIl9cRORriGFecpCqZdC+B6nT4LQZUNoqa2SWsPiCTh8UQI
 X5yNNMKCjAcgicmu1YWpFDp8iPb9y9uOw6kjLJRecV1M4TAR+HsdwzoV1g8zGs9GVK9lXilm2v
 qoVo3LsvCLXEJoHeqSU8DlsX7yuu5Td7Eo9wlWBgpKowlJ2jeHyfU5pt1xweDTu8nn7C9VuUUc
 fTj3FzNMgQRpL1lHruub/QC03QCTsfmB1jZpki66T/hfY4X7/BuLcpP+eAQAA
X-Change-ID: 20261022-qce-fixes-broken-label-e6aaf9624fe9
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5024;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SNlakgImLlcbw4lKkLUFxbVJiRFZnmaVXphjRpLOsbI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2dAe2pJqVxkEm4b2mWoDo1IKaJf9K1BrMJhNQ
 1kyGvBGXtOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatnQHgAKCRAFnS7L/zaE
 w6+wD/9Nd2W47YsN2c1SSQoz/R+eOj3lGaQahRTEn8V1hk7nF2HMnLHMD68je3vNQ+M1rNvH3ty
 YWBpygNlaxtuDszgYjWEIq3qi30pARHQJYWlssCa0gV62LlXyIx4zeELh+z3yAVee0P2sdxmWvh
 yckABv43A0Y0XV7JzhHjJGCXrTVbpE0/LAJ4gOXk/XpAqH9IQw95Bv1YVSWwD9h9P5J13RaaP/x
 0vIo1FKnPxIkYQKappjJwzldZcAuW4KbDYum1CQ16lux09p/dWfZXQMNB/KmTusv9iejdSb8T9n
 Fo6nE6gkDWxDHcaCVWyzLS3ZZESgkcdSxF3tkfilVAADaICYWHwUqgeS97/MeXy1PcJN1y7cfnr
 fjsye0kok0iKIHSHaHjSAlQAPHiwk4HJinm9gKHGjLCDSsiCwIfuJn3GwXPxKjmU38tJEzOR7IV
 zoiWke8blR7SpUp9D3C3iHrRUtNGTvgChaC/x+Bp6AmDp19uuzb1mLa59Sm0GySXw3TFuFXhECi
 IT/t6JG3sO2za+cAN8mJOQPBligwHuKPkDudwTa+RVMtLf0IAmf8XKmqrO7RTLyGh9FHJw/KtAR
 p0FwukgUlgqkpEr6XWRXj95twhM2CTZ4h0eNCJBHv2943UzvwX6Go9ZFWG9kU1DBzR+y82TTiPV
 hlkvdt0QngffRdQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXwt4uKwz2qUTn
 GckESxBTlVTGzYj14spsCfjgPymbwdqd/AZY7p1ALFwyyQeqbm4QkVMpworjKWbK/ehjN8t42KP
 d2stheW6d8/xtQaxtZETQ5wK/w7BoOw5OsWIZy/DC6oOxMWHYzSdNGokktq8VTS6oR1Az5gb3ek
 pBIK/gKdwbLJwdk5O6er+UjPxRFB2X7QMztFDLCwkkQth81MVNpBmrmlfywkCf5qGMYSyt2Z23X
 lHUpq5vs7f9i/EuWdRLRa0Jz73QPJmSO4CSHPAtdjj4UqzEMnPyTRzHS97/vv4O5xcQR4Vc8tvf
 r9U6O4YgJhkd87WFXO3QxSTLkQWkS/yYjNjoOnJkitQqejhNFEvuOYOjS+kDuZZJxoMOTQ77DHC
 mS+3VTWtV9FrV+nMB8WHcQjyzaTviYCmZPsOLjh2KNhRj0OsZin6ay1a4qHGuBMmCr9cuhygse7
 n5syVA8dBQ4Iy9qcC8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXzBpBA5mWbEB9
 qV+4RJU/nArDs3aLgbNsoQtT2tpbRqUubS1Z1uGb5oFFyUlJonXYbbaNyFut1bTvrVCtNvC7MDf
 jd9COyYOC+BzSHLdr6hyTUIUf2GTOOQ=
X-Proofpoint-GUID: 5T0ypMu31P513YRQwGoJyqP6U49Xpx60
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9d025 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=9V_34UpJrwX9EJPKeM4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 5T0ypMu31P513YRQwGoJyqP6U49Xpx60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

This is the follow-up to the three smaller series fixing crypto
self-tests in the QCE driver. It makes the crypto algorithms opt-in via
a module parameter and removes the BROKEN label so that the driver is
built by default.

The dependencies are:
- https://lore.kernel.org/all/20261016-qce-fixes-sha-v1-1-3ee5a30d84f3@oss.qualcomm.com/
- https://lore.kernel.org/all/20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com/
- https://lore.kernel.org/all/20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v11:
- Split out the patches making algorithms optional and removing the
  BROKEN Kconfig label into their own series
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
Bartosz Golaszewski (2):
      crypto: qce - Only register algos if the user really wants it
      Revert "crypto: qce - Mark QCE as BROKEN"

 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 drivers/crypto/qce/core.c           | 12 +++++++++---
 4 files changed, 24 insertions(+), 12 deletions(-)
---
base-commit: 178aff4cf425b3fc51ff09c571fa1bfbc1eb8ea4
change-id: 20261022-qce-fixes-broken-label-e6aaf9624fe9
prerequisite-message-id: <20261016-qce-fixes-sha-v1-1-3ee5a30d84f3@oss.qualcomm.com>
prerequisite-patch-id: 7c93b8489dbf6d4edf932389c4c931d897f38ec2
prerequisite-message-id: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
prerequisite-patch-id: d3f97f2fcbc99093e51f4b749eda4c2d0cff4e92
prerequisite-patch-id: 7c4695a73eaad5db182edb09a608c6bc51883c82
prerequisite-patch-id: f3743392de54aa4ce3da76d11637dfeedb922b3a
prerequisite-patch-id: 02e9caf718743f7860aa19031e6809bdd718878e
prerequisite-message-id: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
prerequisite-patch-id: 4764101927c437b38d71379f95b98c82a20a48ca
prerequisite-patch-id: e918a7b007c3a1b88b526fdf7865b811155deceb
prerequisite-patch-id: 8aba9f114cc43e24c8568caf5ca4e7bb82e54b67

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


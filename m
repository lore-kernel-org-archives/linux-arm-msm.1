Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B998400969
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232487; cv=none; b=FW5swfDLn16yZwBU70MzZ0DIwX29MwkPVK6fBAVpctX9dUOJkNFxj2/HBXZLRXha2s36ZptqpJ+H8cGOTPNushIOGv4dzABn7Dh27JrM/0cKQIzdHKQr4O2u7xia8+Gq6UHOM6hatncQTxVidwR9Knr5SglxYN0b+qR6gUhONYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232487; c=relaxed/simple;
	bh=Fkh4Ah7WLSeBo3KHVMZ+2ej4glu/8nLrf9g35dwUJqY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KEbdN8CHjJwXdnXsPRhMarU3SRMFrdcG/FrES/xvIFWvw6yq4DKeaQh8/mjQRsI/Rz8FNkD6F6w+WIx4J0dfCyVJkCgMCwbPWlaJzJTVeyiDkz375lhWlXE2nrFl8BL3P2ORS8T/tnyNUHkKGSI5l8PBzqdMrxbj8tsevZb1Um4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exUFT43q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ki1LdCoC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exUFT43q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ki1LdCoC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81xaj1663585
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1rcXoXXoJGHOfO03k/U3IP
	9QTqEYbbSvSyD0aNurlB0=; b=exUFT43q2U7OADgX4iH8FKY5qKLk42rpAXkEEy
	XgGO+EPTQD6NSObNIjW6Fu34F6/5ix0vHFpzq1cgkcvTGR6GXmQG4OldJ2F15znI
	QtNBVbNYTD+GvPmBUUIZLcLFkV2J5LXLhcBjbLeAsP/hAne6i9FaxkdO/jFH448U
	JWkBsIw8GWe209nPiTpy+wj6Bh8jrriamo1nwx7wluG9oIE/yM0sTrwE8ORa/36X
	EuAjbneRuVW4q5Kk+DHffxwO/LhDWAvr8isC7I2n/bmPqByQBh6fF6qYn0dim3x+
	/GvJZMZ7Jr2fVbfWuI5WgihksZtb2O45UD8aip/yACVSO3Pw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttrxt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:54:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so49593555ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232484; x=1785837284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1rcXoXXoJGHOfO03k/U3IP9QTqEYbbSvSyD0aNurlB0=;
        b=ki1LdCoCNcGr5DitDa2iqkGGUddDJt/9olyiewliz35Fvmj0HIry55/WUnZdxHoF0e
         o3sg/A5T8WPDsLVf7UEbMY1XqZHf7JIga9G+r31G7OAu2qLGmPaMJsVdn0hW5Hq+2tXB
         hmmtlX6iPjGyFoC8Gp2bNUFZU5c/yOyty2MdjPMRvSPxiM3E3l+iXihmp+Whi0f7zaXz
         J4S3YTdIlSOoTeG2UGX+lU8+qzmGFI4Q8+wVVQ7VJwFI4EbJrtKbMZzhyr7qiLGaQa/N
         PfynUjiIdbbIXnreaOFlTiKAiGJN5c4TaFJAgaZ1udmsxbKRnsF8cRkFPVLSpV0otWrq
         2XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232484; x=1785837284;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rcXoXXoJGHOfO03k/U3IP9QTqEYbbSvSyD0aNurlB0=;
        b=BZ2+9UNJhny+B8zssEfKEx8KrQWObmJApBIiLrHd1sX4GWGo8ymfHhJDYYfPumt7U+
         8J9B1eJvt+nHCbL5pqN9eGBocm3+OlxYGFIfdj6lRdHGKoYW9YMo8LA74Bybxt2NVV0J
         oWFttKctWfiebwOznieMLamNWtbH9AWDfHUqe39SVzidoeAVUjzUCVR6NHIeUtyJHcwx
         T+owiiESHCvUtIJ/TBG3EHHEtVgJ1RzGvkzCWhY1VltcPs9tRPEOxcNU7w7o58euJdmt
         hrD3+rGj/1QtlJGd2bC2RVWvRZ3MPgL1CtDa4+a5blh3iAm4WscKQudlDPVNVIwqbW7B
         /aWA==
X-Gm-Message-State: AOJu0Yw3PIAaBa39ETeLK1up2xa401ya3iqEpAWK6UVT3Q+w14kNYN0V
	VTZySX9CEmCqZtE9RN/RLntgQWkKqzXgWBkyOd5WJog+LxSlJxrAXR5aJ8Gwye8rGp7jdgq3FBq
	5xJrdgS8HuqIoHAXAKfY51guTiXn4PxPssJjYnKPlDYho5QflWR4zeL9gBXPRHzVk29GD
X-Gm-Gg: AR+sD11bFOdd85PuzduEva24587tlx13LBMbKbn+BlYJS8ktVm7EkS5i3mOnuIrC3EU
	BcwQSjE52UGAOmhHJacghK1Bsju12ELk7VXJq4x98SJostZaKjA0zwpfwNRhW6C7jGVbMiPBNbr
	D/iIi5iH2HDXVvcQ85X0gzbxui3dz3CbF74lQqjoGOclMmD4a7V1foHyQ/zPXOHZSqwodqIezlS
	sJi+iPcd2LhOv2nEFj+bhdXThXnk5lsH7a+IBbpe6rwSY+TLnVjYgv3mTfZD8IWEq25wyWey2ZB
	PQHIEOeq+B1NrFe0koBR0vTXe52aL6MVm0/nYO+P4eb0XJJfK6qfW8ebHRmtJgLxOkxu0ep/584
	J/07ix55DKVAY1WBgGp9dD30Dm1qDC9WB6+lfldTLF97GJxMYnYFI+l2XgNHosG9zZkXLP4Vfyg
	==
X-Received: by 2002:a17:902:d2c1:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2d015c883efmr19811755ad.29.1785232484529;
        Tue, 28 Jul 2026 02:54:44 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2d015c883efmr19811545ad.29.1785232484136;
        Tue, 28 Jul 2026 02:54:44 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d00599b631sm20264945ad.42.2026.07.28.02.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:54:43 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Enable ICE for UFS on Hamoa IoT EVK
Date: Tue, 28 Jul 2026 17:53:54 +0800
Message-Id: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADN8aGoC/y2MQQqAIBAAvxJ7TiiFzL4SIWZb7iELpQjEvyfRc
 WBmEkQMhBGGKkHAmyIdvoCoK7DO+A0ZLYWBN7xrJO+ZM/th9LVGTRb174hWKqmUNbNUUNIz4Er
 Ptx2nnF+qbuFDZgAAAA==
X-Change-ID: 20260728-hamoa_ufs_ice_change-3179799cab79
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785232480; l=1480;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=Fkh4Ah7WLSeBo3KHVMZ+2ej4glu/8nLrf9g35dwUJqY=;
 b=X22DgdTq/G+QOb61bSZUXKvYLzCgguHzXaEeCHvY0ZFPOqRaNFXAfZW+m8LqJHRyCocX6YIjW
 9WhjKAbL2+iCxMeKvnZ8szwR7MKv1Bes+/HqW8ZJlPEaT1F70L0+rBP
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfXypxvtio5SXpW
 xqEcTzTpRlnTx9fHotAZGsC+vTfn8N30piKC2Kc3WLv0e7T9JI4nMey2DIuJPVz58S8zdHOtV5v
 JUlAyA3dHAwdufjwdyimzpmOLK7dVIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX7Xs6KzxwYMqA
 AsNifj12lom7nYHPLnqiWq16fU0vaNxXDoyAr1654eCl5MYZFJ36SMFhI9rDFO4bqyBkCeK9axg
 o7/eEYmUDXRl7iid7krP5JS1tqxjWOuv/kEZb0ul/y7GPv+rhgp3mYdneaavzWFJ6EjZNHXHdR2
 FOjXqrAA1/2zANh7oR+1T0jhLUFm2lrOhzB2buhycTCWG56NXC13Bpur33iNP2vTVz0CIh6ydzk
 tSxJztaim5oRM/xN5AOkAhqDO0VwbQoM/FSVr95ixxQMZ5ie0c1kfrY+dw6HRWCh9wlzWYtJIOO
 lgb7Bugi6j0jAxNEam1Ftk81XOYKZDkbdeR7l+7ejU5JfemSeXfyeKSSvdwF+xX/TJ05LUwhhD4
 oc8JbhAyKVTvBSAWSaPgi3+K2PN7lf8oieYRfJh1yjW8fvnR2RFNE9pR0lJEH5GXkXiq8kalfpY
 KkaaSJ+NBB0z6wS1LvA==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a687c65 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M4l5zgTsi59Zh--6b5wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 2HEk-qwNV-ku4Sw15e6YCZscT0FwGRJd
X-Proofpoint-ORIG-GUID: 2HEk-qwNV-ku4Sw15e6YCZscT0FwGRJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

This series enables the Inline Crypto Engine (ICE) hardware for UFS
storage on the Qualcomm X1E80100 (Hamoa IoT EVK) platform.

The ICE hardware provides AES-256-XTS inline encryption/decryption for
UFS storage, offloading cryptographic operations from the CPU. The
hardware version on this platform is ICE v4.0.1 with HWKM v2 support.

Validation:
- Probe successfully
- Standard key work well

Patch 1 adds the new compatible string to the DT binding documentation.
Patch 2 adds the ICE device node to the Hamoa DTSI.

---
Changes in v3:
- Rebased on top of latest linux-next.
- Removed dependency on prerequisite series; all required changes are now
  in mainline.
- Link to v2: https://lore.kernel.org/r/20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com

Changes in v2:
- Improve commit messages for both patches.
- Link to v1: https://lore.kernel.org/r/20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com

---
Wenjia Zhang (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Add x1e80100 support
      arm64: dts: qcom: hamoa: Add ICE node for UFS inline encryption

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                         | 13 +++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-hamoa_ufs_ice_change-3179799cab79

Best regards,
-- 
Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>


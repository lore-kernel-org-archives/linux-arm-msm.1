Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB6D280331
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292838; cv=none; b=XMo0rwt6ZuFXV4QEkNOzrnxXSnzMjEhkrlkNzNf4LfFABRpEWsirx1F6cUKd1fegwDTtbPbBemOGzsq/89nowuDEs8tfIx0hs6YMhKzGGoyRESTNMeWbX9XyAJuM2lsBKa7B0KYv7omhvGUCf+6/9CdTKH6040THGPgC3bqJ/Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292838; c=relaxed/simple;
	bh=tCkTJGnorrZu6FQ77OJqvD4oMCa0G08DpCutA09eEP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZBg5n0B5Y6nwl4T/5uZ6U6XBx062x39fCX6tkOKNREbI+GSCvws2kHqtDjug8pm+q+u+cHcGw9X7y/zO7BcF8fNJW905Dk8KxOosDTaJqm1bos1CghU+PYhGDZhUSWiAj2FPTvsMUT2JzmitWoWHnf99cSsT3eS+uE7XZGqTkSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc1j0aRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYEsRAX5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc1j0aRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYEsRAX5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HDuE308558
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fi87F6NT5fS/ibJVU31YLj
	hdFsFZpCK7qAyusMqess8=; b=Uc1j0aRyyV66EtHbogTzPMdJvpLRThLVlO/c/G
	fMGLfr5H4euiVHBEPOqZ9gTrkYhgTRyfGUXUbjEpNM+w6gw7cRNGi2H/UsXJhXJ1
	jEz2BS92Ds8L1Oh4RyaPl5IjHqQlyul/iC3fu2UxVgXbxtecPSXG1vylQlU8mTr0
	FtMtQlz0BapHH21QqGmYDzvr9bAfJrP/+wZT3bgqwBmsLvCE6jAPdUoo7fdvr6iq
	UDH8SaA2Y1RCw8h+IKbzF6Aps1m2G2AJNlFWgNrWSEUn0SdUSLRF47JqwfNePjrv
	se/0d1Y36FOYvdvmN5+Ez+ZKXmnkvLGBrW8kDAnt1s020+ZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpuygbp45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc98d6a88bso1165705ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292834; x=1785897634; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fi87F6NT5fS/ibJVU31YLjhdFsFZpCK7qAyusMqess8=;
        b=kYEsRAX5QH3RNUcNkfpqaHjvPJLhldiMufCthQkviJfkjRSfKyYaNqwFjZ/cCTjadN
         +Wem3Wq0dGPSgZXI2uCYhmAsGzGnpKrWIZ8dakTtUF4EQ0ziUaLtXzIVNsr0vAvAjrZl
         t91a0ugoI020A/G/VX9osJZ2/5TLU9zGsU1+p4vof9epdUJaxXMxo9MCfVbNYGq0rCDu
         tXLQyPu/j3pKQ/mZRRNBr63aTZ1+78P6z8zcPsMX5fF865Ksd0ND2s5bXcKyifLLFm6T
         W5dtjxFGa4CCg55Q2vOhbCaWRpDeq0xFj4gwOTugTXxSk0Oze4/fGFeVELA287tz5MwT
         WHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292834; x=1785897634;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fi87F6NT5fS/ibJVU31YLjhdFsFZpCK7qAyusMqess8=;
        b=HORlwZjwR2oVfm8YKtR101UKQjAvxdVoMvR+IA+2/Kf+o3hp9z39jem7EX1acamhkb
         2hZj9VqPNueetUej5LFX7y3f2oZPeE08nEIphlVhAccWKzTK0yYH2O8vyxYlHXhzQhLR
         cYxuoC09u7PiH0sa81KxM9y3KvsRY4rWaatHJCjBMHPAGb6T1BdUS8UIoWdWTzLD9ykE
         PlkVbQIfKozjV5m88LVh3s4A5QC3xAyjGpfkuvTJsu0N717KUNZcgpR8lkMdE5ZBjI9W
         Hyt7AFe+B6O9vG91L7NjeCIP6shdARR/aGnp7b9WHdpG2xTn9s2wlFAF3pFpvYhJkZWo
         PcYA==
X-Forwarded-Encrypted: i=1; AHgh+RqpDOPZliQHp7Ue1SFujNf+b9hJ9HPK65wf3jZ56O4m1DNPK3wPnZ0DuvrEVQyxzvOHZQ+3q7sRJQzQhrPe@vger.kernel.org
X-Gm-Message-State: AOJu0Yze0O78dld7VtM0NLm2pz1kcouQeRMIn9LKwoeTkV0+dR44nG1H
	Lt4+B1ucZafc64AR5nAGt2MpLv9ZTzO8cg+WSPS8g83wr5MvFrc6d2Qf3WzcgujVmstOErPSs8O
	R+GIrQ58tXie4DJi6eXqdJEaH7MvkbFi3K5hoE88pEBYm+5u7QHHaN+Qzc9+Sbweu96b2
X-Gm-Gg: AR+sD109bwa/c05vTwzPhumYEAZ37RK8GQA8lK6PFaqqtVp4y6+Rei0gCX1qCB/C664
	FJmxusdfKmffIjzipBzEm1fAcee2/PEHpQSbOXv19TTvqfKndQnv8CW+UUQWcmjUbIflnl+KVLC
	MrUiB+h0FO7+AONHqKuNzik81FVX3YUA059TTtqQ3HuOK08GBq2zTpRioUpv00X2WaEcI4RhP0L
	U3KjXFlr3xj//zFzFfhY/oU+FKv9UMGO80vYsxwdM/HQtxr3bbV+/dtDcoeZyrF36Y30C3FfzC7
	FP9vMZb2qnDqMNJE3cuxNFEcWO366dp+LklECOjOBivM/717UvjCHsfpUFufjyeGyOJmn2L5CME
	x7YNiGg+TK3g+OrtD2i8fGmNBSfuOdjWqaBrYzwTPO3ZH1pOVlJ8=
X-Received: by 2002:a17:903:2290:b0:2c9:99be:f011 with SMTP id d9443c01a7336-2d015c75207mr42582555ad.6.1785292834376;
        Tue, 28 Jul 2026 19:40:34 -0700 (PDT)
X-Received: by 2002:a17:903:2290:b0:2c9:99be:f011 with SMTP id d9443c01a7336-2d015c75207mr42582145ad.6.1785292833951;
        Tue, 28 Jul 2026 19:40:33 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm4052694eec.19.2026.07.28.19.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:40:33 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Describe the PCIe M.2 Key E
 connector for Monaco EVK
Date: Wed, 29 Jul 2026 08:10:28 +0530
Message-Id: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxoaWoC/32NUQ6CMBBEr0L22yVQgVK/vIfho5RVGm1XW200h
 LtbOYDJZJI3ycwsEClYinAoFgiUbLTsM4hdAWbW/kJop8wgKtFVUkgcG3TstWGkdEUnMNU4TW1
 Ho1JyL3vIzXugs31vq6ch82zjk8NnO0n1L/2/l1Vh2whlDHV9q9SRYywfL30z7FyZDYZ1Xb/Sr
 BfzvQAAAA==
X-Change-ID: 20260727-b4-monaco-evk-m2-v1-dd56eb997378
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: FfFTw9C4LGTrHxbpg9K6dxdvZsb6Mati
X-Proofpoint-ORIG-GUID: FfFTw9C4LGTrHxbpg9K6dxdvZsb6Mati
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfXwox1lVcYdVAz
 KB91/8if+/DMuqdzbfuAQ5Owhz9bgGwqASmcERHpmaVtYOnq8XiwtbCdH5nPGNa/tG0Yvs2KFyi
 IualvDdsI6by1nXCqm76omqNtbBy+LJZKSzpLyT5B+2NKesouIZjPtGhtYbN8AfAGhUOz+K+Qpq
 O/GYC59xVMyIkNCCj6L+VFscCiOP+yGrijpuFDwHMpw1cHDnSZZbiOVTNxeqTwxIGXhd27psegG
 lM9LEqibVsWSmJ4BTdIkPsEkLGhNpwfcg2sIICCGMlq364wBVQwd+TvUzm/3gwAAnmrAca8QVmr
 ezHEz8vXpmFSEIbFzkDYozYy4Kc9jqq0V7MtrQ5wwcmKmLKMJ9XLz3h5OlNu0kbqDUpyttBVThZ
 pyrtYPoa6oUBDRwyxaElUGFZL1oQ+TqeK8M/7NpDVLT+HaVV6o0Zi9bBX2bYXZwpZVXMAo25lEb
 JIcFT7yludYKnk8bUZg==
X-Authority-Analysis: v=2.4 cv=aoWCzyZV c=1 sm=1 tr=0 ts=6a696823 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OsSWhblMiiJ_15gNRDoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX4KKdOCR8+1SN
 d+cH/2Mgv6Zu1lMBgmf/LnCK/9IP9j6+dzmPJMmc+6WcPNtTEUQ5dLDsdyRnsaP9jbU4ahHE26x
 JpHMyia/T3Qgr6+shYVwvTSpBZGpALk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290019

Add DT support for the PCIe M.2 Mechanical Key E connector on the
Monaco EVK, following the same pattern as the lemans-evk series
(already in linux-next, commits 67f06acf/a6d4bb0a).

Patch 1/3 adds 'compatible = "pciclass,0604"' to the pcieport0 node in
monaco.dtsi, required for downstream DT nodes to be matched to PCI
devices.

Patch 2/3 adds empty labeled endpoints (pcieport0_ep, uart2_ep) to
pcieport0 and uart2 in monaco.dtsi as graph anchors.

Patch 3/3 describes the connector-3 node in monaco-evk.dts, wires the
endpoints via remote-endpoint overrides, adds the vreg_wcn_3p3/
vreg_dcin_12v regulators, and adds the serial1 = &uart2 alias for BT
serdev enumeration.

This series is based on next-20260726.

Changes in v2:
- Move PCIe Root Port and UART2 graph port/endpoint declarations from
  monaco-evk.dts into monaco.dtsi, per Konrad's suggestion. The SoC
  DTSI now defines empty labeled endpoints (pcieport0_ep, uart2_ep) as
  graph anchors, and monaco-evk.dts wires them via remote-endpoint
  overrides. Splits the old patch 2/2 into two patches (new patch 2/3
  for the anchors, patch 3/3 for the EVK board wiring).
- Patch 1/3 unchanged, carries Konrad's Reviewed-by from v1.
- Dropped Dmitry's Reviewed-by on the EVK patch since the port/endpoint
  structure changed; open to re-review.
- Link to v1: https://lore.kernel.org/all/20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com/

---
Wei Deng (3):
      arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      arm64: dts: qcom: monaco: Add graph port/endpoint anchors to pcieport0 and uart2
      arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 69 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  9 +++++
 2 files changed, 78 insertions(+)
---
base-commit: c5e32e86ca02b003f86e095d379b38148999293d
change-id: 20260727-b4-monaco-evk-m2-v1-dd56eb997378

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>


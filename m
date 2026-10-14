Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19584BCAA9
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980362; cv=none; b=g3eq1HIG2HfdLXyhc14YZcRk9+rKU95GEepttXVWRrv2qkJvbYLksC0F1199hzWcm6gNisd1lIMeuSFKiKkd05Ca2S8+SYf8SMDOvFk1S7HZ/DfZDpkufSgDugcoirlIngswSqfK2d5CxpG5rrEz8o79+9tPuUEoSV26ImhS9QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980362; c=relaxed/simple;
	bh=qhS8MNkDQHRfqbTNQhDUBpErJ9biaMj+d95Ij1s7z7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxzvXKm2qiG4VleY07Vh7XVcLVNqlvhl2/jIQ1VdHHN+EP3LNFM/UquAEcYwV+3EyXga7j3GLgv5lHb0XDUGBtoQPVqMeQ2SKkqTRQXDFO9JSVvh6NE/pbY9LXWDsL4/ZFqMYxyRA1n4YmbJBAUAN0drMxWdihPSQnhZuZ+tJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUjq6TUi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx4yXjba; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUjq6TUi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx4yXjba"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9Lu362222162
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Jq90LBuDnLYVMzo9xa4WUu53RzmLM94/Z9r
	DW7XH1P8=; b=PUjq6TUi6UYp1s7mZcV6KoqAy/UJilYnmKEM2RNGg6SZOkWvXiD
	XT3bgtn3fPYKeSFqMKlj6U4Nk03oo57yx2s3wSIwRMTI8aQJTzFvrJbYjfSEqwOb
	1PfgTaFvbGciEVP0CYN6u5fPjB94lj2xR0rZBMF8KzJ6iareHPsn/wsQRX6rPbOO
	nNTQYbcYs4GpYwG9NqFv3Mgzc7VHG/sJLArXyVMo7QzGuqXPKdsc+zfmADAZpnwg
	PnzK5MqJw7PMIGE3mZlOoifwvr3cs/xidIqGnIpafk7GOT2+M9vnRY8iHDEOr4Hz
	64sYBX8ZdzT5vRAKq28recKC4Wqhiqed7JQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsbj1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:19:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-899c18ffcefso401828b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791980359; x=1792585159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jq90LBuDnLYVMzo9xa4WUu53RzmLM94/Z9rDW7XH1P8=;
        b=Gx4yXjbae4yge0vxt6SKWEjIif5kEU/moLyVGYgo+/dM4t/ZcyPtXk96KXK0EUjOvt
         32xhV+EIq3SsvWSzthqZn6V9qU860t/27IsS45IH3u+MC37stxbwfFUQip70EoXTjIHi
         P4urTxFNHHyMHCDSI4FrB0QlnY1Ix7Ymz6F7u27kFeS8Dc2c9O7drk04JOdcYyPy6+qv
         yzsrXVCVNACdviHYJ7RefHOrHxltgEi2ZfB/FDTcc/mobaxiKx/Dbh54b03UcAcFcFvi
         3w9BIh21HIEIyIAPFz0vo4Pky9PWxJ1GtGb7prtOFNz59WR477twL0ctm8W8ThQKXPzC
         fHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980359; x=1792585159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jq90LBuDnLYVMzo9xa4WUu53RzmLM94/Z9rDW7XH1P8=;
        b=VZQSjPrm3iRaLQGYHmB7Ydve5a9xJPlOemhVfmGws3OW0Dot/fy6m2olsl69Gknjzu
         wU4q5eLL0ZjPwCUrT7txZNkFcxAJuwyPyMQDK0PjCeyg+9Mk4jisdhBIbO8ukpX6xw4A
         JIEukk1g98VIGSd3SzeocG2f/xSc9OHyY8watJ6mrjc3wytRCpZrP0aqsdjG02nbIhG9
         EFNP8NYkZbcp9u3NKCR/8MikdXWhrzvuM7j2mBp0fxlbhUeX+kMg3L4/19Utx1GBb2+P
         3bODrcI0K85qn2pOYjv7XoSiv6w8jmNBXQgBf/ZRyXoZ7LGoMBvOpDyDdRoLC0MqV0je
         Qeig==
X-Forwarded-Encrypted: i=1; AKwUvByFYSrl5NjyBZeNxeETdpq0tKDc7vzshtwaKRM/uH7evXAiiwq88Fk4g2c+DJWgrtl+sYH88C3x2crKmMOh@vger.kernel.org
X-Gm-Message-State: AFq9FYIthJo+E/b5b6Clw227YbLxA7L+CY1ONjlt4K+7SfDvQMT/b1Kw
	Rd1QgFZtefHanOXTIqM1LsVl6CPvYIOWah/AyjaBW3+TjY5vvFpo+ly+TNyyHylBSZ2tKKGK25O
	c8F87eOOtoJi7a6Jeu8vJIhr5S6MOmPEwA88H68jsS6wRwx3b5dtE4gNAn7ndx47P7L1g
X-Gm-Gg: AYBFou1GfjgVtSRPg95fMQzsrT6MrZDBayWWijDhBr7NcnA3MdJejMnh3Lpq9tJAW6W
	TJsEH68Y5dCx99wQS6JKr96wj2s4kzI4+6/aCHEIM3ryjxy+u++ngFG9q47uDEwOafJy15IibBX
	5RUdJWo4QvSQ/i/X8Qk3++5IKXIbcb42n0wuwrawJcA4PRpMU3ER1stP0fCaOgKcC99mRffUHgh
	ddtgjDNgT3pisbI6xKmxF59pMw240mgsbIEPt2nl1vkeOFdY7Wb/sWfG+3nkQX15VNKyHXyb4nH
	ZzC5Tr7d1XdV0K9Wpqw5gD1UPLpxLMbMoS1xiCSIh9dhJBa3VQyQc/CH3r1tYU4miwGxGsphk8c
	dDhtTZN5ANGvjhCB18riPXKyEuosL
X-Received: by 2002:a05:6a21:8285:b0:3de:50df:7faa with SMTP id adf61e73a8af0-3e16bd47a3cmr24640037637.1.1791980359368;
        Wed, 14 Oct 2026 05:19:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:8285:b0:3de:50df:7faa with SMTP id adf61e73a8af0-3e16bd47a3cmr24639989637.1.1791980358858;
        Wed, 14 Oct 2026 05:19:18 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm1016990b3a.43.2026.10.14.05.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:19:18 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Wed, 14 Oct 2026 20:19:07 +0800
Message-ID: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX1CJy2V8nsYMb
 jHmI0DmNeJx8Z+ADUS/Poy2Kyob5sczwc6Qk9zH8wbzHD8j/0ANWi+fFz2Cns0W6rD45bZ08oEU
 rkDK3RDsVbngR7jsIf/K2OPQjqv9GPKyOyd3Ec0z6R/s0kxKIdXLLcs8U/WkBghun7T7ko/jRwf
 qkMQyvUW2Y15vkBLZaBG6tQjixI1BLvAgf7wCVbw9I94HxZ6kYomal5n88w5e7J028NltxStVkI
 yZVhBfR6QoiYvmKHQ2HrQzIr1CwOwapMggbuPmJKl5Nqd77bm03bCGlmMS+F2xs9Uy24ousHivo
 pZpIIQQuyMWUNugm5sa4uGTW3ln313b1WiGumQGFUEZK4iyG+nOY6EXdhJMUG/0TGObt9LXg46H
 jlu1IxA8Dh8QNLoT03bpwS2rYwtcAEqvb8j+Ecy+BxSq2RzQhkUz+7hLMFBWbKlWyRS0ArlBcMI
 TzxceX5w1JA9HjWKDNg==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf7348 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=LbSbASDYXwb1C5uybScA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX47NyWOfc2jFK
 7D4lnaJZaZM6tG9Ah090f4CF9WuLKf36DgmAd1QyBNPHC234Actc95kf+jde7Dqdxaddjq+oQyr
 HxERWqjR+jOhp6ZANv/QxvUeODu4Wk0=
X-Proofpoint-ORIG-GUID: P4EHMvs3limJjatKq2N5GvgqLzOie4fL
X-Proofpoint-GUID: P4EHMvs3limJjatKq2N5GvgqLzOie4fL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140048

Some WCN3990-family designs connect the SW_CTRL output to a GPIO on the
application processor. On Shikra, the WCN3988 SW_CTRL signal is connected
to GPIO88 and is used through the MGPI/AOSS hardware path to request the
required RF clocks.

Qualcomm downstream kernels configure this path through
msm_gpio_mpm_wake_set(), but upstream does not provide an equivalent API.
This series models SW_CTRL as a dedicated wake IRQ. Requesting the GPIO IRQ
resource enables POWER_SAVE_WAKEUP_ENABLE in Qualcomm TLMM when
WAKEUP_PRESENT is advertised, while the PM core keeps the IRQ disabled
during normal operation and arms it for system suspend.

This is an RFC because the intended hardware and software model still
needs confirmation. In particular, please advise whether SW_CTRL should
be represented as an AP wake source using dev_pm_set_dedicated_wake_irq(),
or whether Linux only needs an interface to explicitly configure the
TLMM/MGPI power-save path.

The series documents the named wakeup interrupt for the WCN PMU binding,
implements dedicated wake IRQ handling in the Qualcomm WCN power
sequencer, and enables it on the Shikra CQM, CQS and IQS EVKs. On this
base, CQM and CQS share shikra-cqm-som.dtsi, while IQS uses
shikra-iqs-som.dtsi.

Testing:
- scripts/checkpatch.pl --strict: passed
- dt-binding-check: passed
- dtb-check: passed
- sparse-check: passed
- Shikra CQM, CQS and IQS DTB builds: passed
- QIPL validation of the equivalent qcom-6.18.y implementation: passed

An earlier experiment confirmed that requesting GPIO88 as an IRQ changes
TLMM_GPIO_INTR_CFG88 from 0x942 to 0x9c2, setting
POWER_SAVE_WAKEUP_ENABLE.

Linghui Wu (3):
  dt-bindings: power: sequencing: qcom-wcn: document wakeup-source
  power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
  arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup

 .../bindings/regulator/qcom,wcn3990-pmu.yaml  | 22 ++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |  4 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi  |  4 +++
 drivers/power/sequencing/pwrseq-qcom-wcn.c    | 30 +++++++++++++++++++
 4 files changed, 60 insertions(+)


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

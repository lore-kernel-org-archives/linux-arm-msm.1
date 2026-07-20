Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0683DB326
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563384; cv=none; b=ZPO2W1FaPLM/mloTv7IA/nLNSLCZrZHWEjSszOhmFwoj38/wQAgsSUkT/L0eAV5vMaWfT2KAtFab0tIsbP2voQOKBPmTcScHuaqS2rKWtNQep6aWSjwI2qM2IuFdorR4MfnUj4O5EW5kX7bpJiotQhH+UnTkFfIJFDC8X76G8uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563384; c=relaxed/simple;
	bh=sQl7WPJ5J5BoF002nBCIMZf/2vH/R29fDZ+vXQkKnNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MzPHWsKGNiQ2WDur6Jjr5ZuagDAqdk6IzzpGWKqMHaccSTsHZldvRKdhRcDK4kGd+Qmdxd0VFB1UHRG1mJ8tLXN7urf0OTHhkGpca71I4ua8O3TbGJzyiN4rF0fceQ0mvr56bqlisP4Dy7ACA42NHm159IJ0LE9bYeaZpfZhdiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7aOBaWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2CoMZDi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7aOBaWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2CoMZDi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFw1Wm3259623
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 16:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Salwr7ZkvoC+W+zP0O+9TJ
	cZbgxlmEgTJU1zU+SmQIc=; b=K7aOBaWsMXSEGRUmlJmnfnKGcRbX9y+oWuXlyD
	PTtQZtE2uWcSqscd7988pIr9sAb3Tslz1PbdqmI5uqB/kmY1TEvHIMRl7XOQBMAM
	zpRKdNupWwEE6/VCQdj92ANtQKy7idgqaCZiHs+ZZ4JPawdzLXxrWxSR+BR3ruzJ
	BakVElzaUN9EagwlI7UC/YyxrK3Z2OU2yclLS+TITxfjvPnasTF9bZpJcTEKUa5D
	MfZai4pObhgUFKL4aCyiPd+eJdcuF9GbCSV/+lJBLh4RznW1Ont/P1xM4RKBccn9
	LDqMFp8haO8b4u9hZJXEFX+wfICQCwNus5q6LkDH307rEhXQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcj8ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 16:03:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so2946675a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784563380; x=1785168180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Salwr7ZkvoC+W+zP0O+9TJcZbgxlmEgTJU1zU+SmQIc=;
        b=U2CoMZDiYbibYDn16M+u78KeyOwiJCpKQeM3gB5qOz6YczMdpHD2iux31N/qoN1Oej
         Qq+fRFAEWuk1WLSg5Zvah66TKuAYnxkoo2D9bkFIP4FxmdKrjIDn6huuNC46a8XJdjRm
         ycW5HWZCZHNbslA5NmRt8I/+25XZzhvSfM8uaZFCNtvvoQSKCFVc6LwiE74F9ZmOp7Ly
         A+rHjyrkDQjYUUOFbxSQNxX6o1yITVdNat9p0TZjiCpQ7gr92U4OoNjLsjgh/1lPFESe
         SGNWr6zwZ4l+gka6huh43StwsZuXReDHyvmkvZwux5abpkUCjyS3E7mbp3NYOYZlKIfC
         Ry+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563380; x=1785168180;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Salwr7ZkvoC+W+zP0O+9TJcZbgxlmEgTJU1zU+SmQIc=;
        b=F3ZagJJbNaHZkq9ICfF2ESw29DOi9bVczXwz4u4Nyo/IrFYNUQjlUeG/3h8ztzKKbG
         HLeJDVW2hFvWAe4Siin2gqHrxVdUGIwvJ2G8UGe+B5ZXjNbaGDeoIcXdwXxabT2lPBR+
         giPZiM6Rqvs52pIAOXcy4njssqmB51/M2RKF2CakpeF0ULjtN3T4q3/8CHTaaowZ3/Ay
         ly3UXklEoqKPKVFtjxB/pY5+YU7u5uwvxFGUY90VgA9Lan6eLKUTk/OlwImuj93EGcxf
         BZ5kFGC7gIOPVjRyPG+cDZw+iUCKLD+sra2JyIA6+5lw9WO5EhGbN3xhyltE3rOtNIjh
         hk6g==
X-Forwarded-Encrypted: i=1; AHgh+RoneHX7kU1PHsSDxvFhdgoQd6v4G7QxEf7VHX4flFnzo1EjZIl7vZIKTqMj6i7ANaa+pVZ9P82twMCjrPD+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw12cf2uSbj8fIBYgHtTZuSbh7bTOXKVmcTZmkVqMjxFoR+BI12
	5RanrdOtsX1mMUsNJi1jj8JUkhxBRVUdQuf0HPhuSmJAihV/l+nvhf+0nTPX5UkpXENgUuR0Bso
	fFModLtSFUelmE+v9ACd7BJ1DoJfs3Mp0EsrLGcYB/IcCJZ3SP4xzArLGUQDXz18XNrmn
X-Gm-Gg: AfdE7cn9jImELG+s3RhPXGd4aexu7h8fRwI/SlotzUXDCzbyv/AlyuXg6fQw8lj0G0P
	2VZMAS/H/TELBkFZR8PGc/YjDSgjDl4pYHZ25AGumMxqOgJwSS2hAa66XC6fFraYKza9CUubGAC
	gGqYbMKzJjnaYBjGYJJl/whZ9I2tuf8d0YLbnjz/ee0JxBkQVZDyKiru8+EA8X4GlPIkVbAcvOc
	rLEt0elBV+Ykhy0aUZetH8X5z0npYKFD2DiOaiYE2HKJsD6GoTDfX/G6ZChfCP+NO/Q7BmRNUIN
	FaCgjOeSseRt7Bn+sd2sY9RMvvMgpe8D+GsQ7bGi6GAiaccei100SPqETYhVu2jOFLuNSYX8DOO
	k8SdWMIOPQTb5wprv4pVS8An5CEyCidv0bhGU
X-Received: by 2002:a05:6a21:6b16:b0:398:8870:b58f with SMTP id adf61e73a8af0-3c3ad5d463fmr15393347637.14.1784563379255;
        Mon, 20 Jul 2026 09:02:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b16:b0:398:8870:b58f with SMTP id adf61e73a8af0-3c3ad5d463fmr15393291637.14.1784563378650;
        Mon, 20 Jul 2026 09:02:58 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm37616115eec.7.2026.07.20.09.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:02:58 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon, 20 Jul 2026 21:32:23 +0530
Message-Id: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xBNNu9kY1rFUofqSmclOTd4CaQKpSgsP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3OCBTYWx0ZWRfXwch/6NAlJoz4
 6eEl4a4VLo41NLGANA4GK8As4Re2IEf+akcmlQ2ESLxVcz1sNpuuRIJ5kRujjr0PIdZiQmovvui
 c2u/yC5Qs5MYVgjRnTQg+WLhdRKK6F6FMKKhxzyNFuCuADCmVWpZ+FP8Bg8+7VS8ZnaNWLJlBqw
 f+fN9sRQhq3BU0OjBp7FQ65un+M/FC+YwY/MqlIzuaUl4XhA1czs3v8WYum7q9Y7Z5AcuEq+tPj
 Y++Q8BLPA8gzBEYdXhI3QgwpEjbWGWk6LwJl5z2Kk5xbFVnhhIkNDcByivhaz02gCOpgOT+X3Q1
 hnLWbD2ZAMOHfQ/F0B9YlqdpSNZ44ScyFS1hfbaYt2pCpCwWLOKc0AoknUggrgLqRvkeBgAvfNs
 JPNmF/N0INsE65XgUOxuHSPzYDFMIjLN1PUL4+dr1YQ/MhwT7xCWtO9WIAGhhPHMMYrsZZmk4HX
 7k9MQJ8oBuQgrWjb6eQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3OCBTYWx0ZWRfX/K9Uj5FfyUKA
 vBDl9ctg+kVYW3khzK/NpM1sKKL5oO3VjKt83RqzYafI/pEyWxgaS9/ZYXhoSvp3e70Aa340lR7
 5VDANmIA1cXOyRG3z5QG7o+PEu+9fok=
X-Proofpoint-GUID: xBNNu9kY1rFUofqSmclOTd4CaQKpSgsP
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5e46b4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200178

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

---
Changes in v6:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v5: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v5:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  53 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 194 +++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 251 ++++++++++++++++--
 4 files changed, 480 insertions(+), 22 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.34.1


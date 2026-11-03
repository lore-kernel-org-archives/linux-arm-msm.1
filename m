Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708988;
	b=eqRCVMyR9/uZKdnEd1OkM73d57EPcLlDEsjOGvM1SmV7IvR9fRjCKOqzT66I9vLgYrO2
	 61G2ecfThbZpZXDnRgh5q/Q7PBA7xWTxLQjnwSoCyFzDUVivowwzXBwaxvwb+xlZf9VM1
	 wHUFCh/6jcgtBDTK2sT7wqHIJvDtaeG3pWg0Z1qcJBqa0wK3qqYyf6c3W9I/fgJL1HECM
	 5KhyYEr79k1427nrtIrYe9D1q5O6IhGBPtemAcYammq/hJkbrfdhv7i2HgL8Ox1LAUbjD
	 1LCt42mmPTHxRLDiJyZ757Y88b755peFiDDJvrHlAvlvGwBCGS7g/oZP+2Lv6r8zVsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IDI+igDoc6QkC7pgWT8Wprn1keJKc8oLjyvAr5GbucA=;
	b=gS+KogYJxoROcwRTrTTy1n93qokzVD6siS8HuyWGRRIBYlx6avHSS4xmBHCK1d8m+0Qt
	 Oiasc/Eid1HjXB4G9v12nwgHAQPMiro3RiaZb+YH7dW+2uzDaMjUsKtB5OS9a8r1TZyXL
	 4lKatDC1XeJWhuKTIshR0J7EXanYPHmzn4xtfDAdfUQZz1CuOcjqYRzuetXyNsbueJuHM
	 XHxqGzKnftFszCg3jXfO3aIuKw3VfrHDgXIZNRmoEsr7hyX4UGZpzIHC3L18nHIyZE6pY
	 dAWrQl0qJQP74qZZ6shMK3BbJEihjT1jGugvLYWneFgGox5xKPO+v3gHmCIeYxCtgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDDclsUC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gugOoYN2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6AC606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 12:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6AC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDDclsUC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gugOoYN2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3CPHbs1889821
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 12:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDI+igDoc6QkC7pgWT8Wprn1keJKc8oLjyvAr5GbucA=; b=EDDclsUCxxBMMyPS
	hSRvJNY9XyOMPssJxN2bWsAG3M5QV3Mo9ybSqfB56MCR9Gvl4jcHa4oZ5CftGMW4
	vzKklfqahmA7YyvrecFKafFk/s+yDkTrZhvYlOk+YO+p/UX0Lwcnjpu9UeCDwQPj
	VAE1xx8G3frBAyWWVkaZ9qhkmBdv0L7ye/k+4iHmsz3U0kLITNPElieRfQVAJLTf
	IVbCfW/CDlXcdVNCj0rEuogCOHzRPWD2XTjz6KffviY66ir/FXJry7sgis8RnXvk
	9NYXWmso4AmHZoKPeB0cbleLnfp3F302T6DhK3FdldgdcHLyquf3Tx4gJ9eJMKow
	3nzbww==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081upp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:29:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so3064792137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 04:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708986; x=1794313786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDI+igDoc6QkC7pgWT8Wprn1keJKc8oLjyvAr5GbucA=;
        b=gugOoYN2/WM/kDivAuJBtXpihzzVU/JUJS14+FC7Uhqwdzb0ooMCyd7j2rBSgjpJo2
         L89FbR1PoSRMS6cqxm8NK5ZipdUOkd/ku3vUUsR6O6LM/+nBnMfmdE9Ms/YTti0kjO1d
         6Mv+HKKwzKc/21lG0ENyZQ5I5AKSzW3t1Tv7Y6z1kSggyzhETO+IcImhdmCuPcWF4ocl
         SAvtUnqKl1dpH1deZ7Tm302bganlXr1ayJYSo3GoOzXGIOtboF8lrMQEhkZgqA/Uu6rB
         LfJgEjGsfgCcd39P8fqs8aKLI7nNrLpgC1gIPEI7cY2kNwR7Fd4TGKJb6KM+0rUsSC2q
         V7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708986; x=1794313786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDI+igDoc6QkC7pgWT8Wprn1keJKc8oLjyvAr5GbucA=;
        b=1mj1Q64Ml6SxHnQvZXco0oJwptLBSwkR6PeZxe6mICxWUsoOkvKO7VoC+ZwBbwrVON
         HdM/AzY9i9O51dA0h4eSdCkd4Y7hQHxVvcr1O1gy3NfV5OjOLK8mlJ0iXPpmbaF3AU5j
         rBUfvfUCaZxcHYrT2ocyxI+rhfwLWbSSpk1ClXQnNgI6TGT1MGC19UXwhVM3MCXVOpeE
         PhYMUUQfw3p4xsPux9HkM7HgXB0m0lopEgaBazm8TpGon/wnhLFPFf+G/oKMn9BgEXt8
         641iwGOGsU9yxKp0xBwUp8W8XNVuUJtRkT5xudPeY2903wUuZ/IoXVUXgOEF3dFdFO1t
         8Gxw==
X-Forwarded-Encrypted: i=1; AKwUvBzwne+pAjzFXljG4/P/mlUnNT0Z+PWSPNghqVK5rRG8HgqNWeK+SxcAI+3wK2ZnE7kNNkckRFw8QHkw4BTu@vger.kernel.org
X-Gm-Message-State: APuU4Z/xcpMVpfuWex5Kp6ShVscIZKkWf6jJC0mNS5xD+dpPOEh2/6G4
	ougOhfDqyON1n+IA/jiG3MYuPH2bma87w0/qSXmg747qpkmgnTuLMeqvDdAhIX4DFtTEydhnAc8
	pcKsCK8UANtrcd2syEqbUn8Ku3MhYroC5fW/hi4jXYEypUkV+CNtIiSeAoOhW4llQhBjn
X-Gm-Gg: AYBFou0Wd7La211yxtdPreV3dF+SJCcjJWMnuiDOdpcfqXnvdX/CiP9pxztVtbgLJwY
	l2e+hKsgjh2Q9HXZ7F+lfmcr0l04HZ7DshlOS0U2Af7rmHwXG7SxOK1UldaG++rlMOaYh0XHO9e
	zQLfpU+Piw2GvOu9wrqY6N84U6ws4IIWyaiYQcuraGtyw0wnff0BugJcyJT9yPxr/fA1V2hw4zn
	e2v9Ah/uF3O1IOvPMlEa48ugIosObBsUeAb7JGIsG41nooAKcwIXbTQAg4cub5hu1bG1TBu/cdF
	dAiDikqqOb/tLIbu1AtkzSNtT6C+h3pVxZOHOfK0goSItGEtepJf4fdGxZnc1nEgS48EKY3PGkz
	Dzx/i9QYPJ5y5x+UCdiei887pwHnGg383t3pWGpAscHeEGULOz354bvtBSkP0ZrisNSmOGJg8Gb
	kg
X-Received: by 2002:a05:6102:6881:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d07273b428mr4586999137.27.1793708986049;
        Tue, 03 Nov 2026 04:29:46 -0800 (PST)
X-Received: by 2002:a05:6102:6881:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d07273b428mr4586987137.27.1793708985574;
        Tue, 03 Nov 2026 04:29:45 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm28910586f8f.3.2026.11.03.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:29:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        chejiang@qti.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, stable@vger.kernel.org,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Subject: Re: [PATCH v1] power: sequencing: qcom-wcn: increase WCN7850 power-up delay
Date: Tue,  3 Nov 2026 13:29:42 +0100
Message-ID: <179370897915.27908.8240780682152468371.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102094800.3225454-1-shuai.zhang@oss.qualcomm.com>
References: <20261102094800.3225454-1-shuai.zhang@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX0Cp9obQtTML5
 H7sHzZEBu1D6F9IRcvlXP8xcUkE4njPCQDkXeGooZYQFFyqHf7W/DVK7KD21QyxljDxY0tdSU53
 Z2p4kXBkS7zgc3uttgh8B63gua+R3jk=
X-Proofpoint-ORIG-GUID: CdoyhZZCmbsMsxfiXBGU11J-lPW0vlqx
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9d3bb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KLQxzaQ-LYvYA5eWPjEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: CdoyhZZCmbsMsxfiXBGU11J-lPW0vlqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX9ioNLQze2F72
 PAXHSPZq5oDM9qzmSC5BiU392RzTxDwt8JJ8LI2jBdqj/s8CPUh7OdvgGQt1YfWzCFNbtRFvHq+
 i6rzLm6VV+nXT2YdPCzufrjGs2cknIcdiuBEVnVm+mg5hZEfHaz/Gpfftas1pQ2vGq9XleHn5Ff
 EYQ99SSdvd71ogOOuXzP4C12COTpu654PRnWwrmdvdVz5QuhcbUt+EI5polWdCqXCsJjvE6FBno
 8d0v2PO6c6+w7BhSs2HxZVUWdXUiQUvrbDlPQeJeT9DR8n6SWXOqXQrIJKhe8bYcr17z0nmLAzh
 And4INYRQ78D5TO1Vop6sG1kGiNzBB5iqcRosxphTrJ3BYAM69l9yqhx6DRmxY5evFnRKawAPj9
 bnumWvlTAXmNgTYgTUD0r7HSwyGACdOkEMpB5/qfR4Y7JBZPzRuxOgcTPf6EoE8FWqBoZ/42JM3
 2i4HpZm+ISXrr9x56fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049


On Mon, 02 Nov 2026 17:48:00 +0800, Shuai Zhang wrote:
> When the WCN7850 is powered up from the Bluetooth side first, i.e.
> BT_EN is asserted while WLAN_EN is still low, the chip starts from a
> cold state and is not ready to accept the first HCI command 50 ms after
> BT_EN goes high. The first command (0xfc00, read QCA version) is lost,
> hci_qca does not resend it and fails after the 2 s command timeout:
> 
>   Bluetooth: hci0: Reading QCA version information failed (-110)
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: qcom-wcn: increase WCN7850 power-up delay
      https://git.kernel.org/brgl/c/bd60a639b621453fe37b780df4b6d3a13f981f13

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D705432BF4
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841640; cv=none; b=G2BANAAK+jiuIMY2AL1OVLi4cRojSi6ru0RJ68FzSlXnQRga4/v9hLneoO/jeT9FNgTzynB8Tw/DrwV7erahv2AaPsHgduhlGsKTEMhAFLKwDLSbNSVd4Xm8yqXhBy8xrW3jo5QXO/Xe/Iu+eP9y1Fqe/r65Qm77WpD0zNLrtyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841640; c=relaxed/simple;
	bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRAHNJBpgV0xm2ZLnRm/99ElVosMYesOp08HHdK09p2jygNGp697srMpyh2+rOhnFNIdZa8CioLIKYVkYWoHcofTY19VP0EZz+V+MuLGZLJkgAjWXTK7hbRggi3FWEfLXwTWasJpR0Hk2Zd9aua82Wfw2Uxk835SJi8lnLGvg3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqJlh31x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWm2AQfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqJlh31x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWm2AQfV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CEbn3779552
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 11:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=; b=GqJlh31xkIGa8tFO
	+g7zKln+8Bg6FCcUuNr4qftrca60TdFNdcwaJWk2ajKoV88fCmbcgssJ0FR8twRb
	wkcKg9aB2l1bTC+ZA+I+k2FySWFrVyCZly/vnmZuwdN8P3QSiQPVFEvu8reTpZPU
	WeMVCrbcM34BtYK9HinwXBCsolbt1ZHRq9/GXG2WSvc7VGKub+Tk8WrQQJmvUkn5
	cXa6l0e2ixD7qg/JcU26zhOS29f6pNebqcdcGP7CvtVukgeqozWOXZZOgjXSlNAv
	U81vBfefEjWdvAle5PYyfXo4PJcbesO5mXBAnOJYPKft+bGINJKVLANGDDUITss8
	UvOPAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p4u6by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:07:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so37962295ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841638; x=1786446438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
        b=UWm2AQfVV23kVIkFRAeYGlybX9JGRMCODRvkt/mKx7rEU8vg0Sbc3uUfOvzdreFg3b
         iyd23ZOokYA2e2ZjTfKOBA3vgPj1Y3GH2gN0F8ePU7dQ/iqahB/CwXlphJ6IfLXjTkeg
         x5dd4UY924bm+iQOP4HMaEpkGKRCc31jwuFAJmRL4FjzJuc154HhCqwNP9ZfPnAiBlOk
         LB/wIQ9CjEmSz2qj3oLA20znQHZ9bMruvDh9T6QS7l86gd/d5qwF7Y35TLcM6qpsCdiq
         jH+3sleF7m/n4BbxgBa3HeXfpSK4G8tI6uyZ/6RQus71hXCjHXeHw6heZhYhK/IqZF+J
         vYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841638; x=1786446438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
        b=CWmvTsSnsUzcnAWLaD+gcNRqoJMtUape+Ps+joEexXJsBoG3Ha5g7wENros7MRnaw8
         H9yXnQc0olraroP2PvTsEC4hMSDrtKERQYMY/68li886T56dfNod99QPf0KAsB6Cp79q
         qhSAE40G9qRlaRqwaPuLaebF5dLJ238g5q4JjQjfCwXQPGWyNJccaxI/voBOLnExkfcH
         1kdGozjQzDzWCIqT4GXDk3F9fLy1Y93bcvJ9uP+2S8X4Q8PhBrzCCRkdlrsxMvBbpmHB
         Fbnw0+apQwGMRlveqOJ3WxzCpCo8tqp7uT8oT+gwI8ic6TFhmpD5IfYGZDcInNPx+iTu
         HIjw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9bROyaE1s0MIpZfQBRVOWN5a9ZZKiJxxZPifLSoT7qsWUyvigLeyYyS1n4G0yDtUxAdMqF7UfN3w1etUN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5gHL2aqq5GBQP/qz8bGNUtvTzkoZbFJzWecVeCqu4ywTEQEtj
	ECvVOBNNiB2ceKZAGVYdzsZk708R0/oLLCAfqWKAby78jDTzgLpMB/YfB1bKqHARtO0OX7iplPn
	llJdCZpC4OT4bMZ2t5xnYZpJ4twNRkkJ1a/vVCctS/avZcLudQszB6FRBgoJNdebTE6kf0xk0Od
	re
X-Gm-Gg: AR+sD13fxFcEY2ExNmfq0LEyNDtg6qEUBYOMJcPuWIvyPLYVCsmcdLOBMjeg7cjGDSx
	S3dBOGt0zUsUcfPim55gPe0pAvR94Y5w4yA5P2rNmncdo3p/saNixLdCqT42DPtVRPJG+GR7C4D
	9FzDf7OrDZwEX2ECNdcQv7ln1N4GHYR0VXJ0zXByY2V3tACQqdFHtwQ8GUmyek80RRQxrWTV0/9
	3ku2ZqOFAUSnWAPG5cMM142NpD+bHgco4p/XHM1b2c3geP1JZ2EZXg1W62MZRLeWSAGA8KLsPYG
	f7DUJ3ClHeCRIjgDsK78TVWydTI1hIROStVVWTq3mqQvDVYzHwmOEd0TQT+8RuPA9JVGkhgNmDN
	d0z+MVV9kOQcU3pvVFA==
X-Received: by 2002:a17:903:2c0c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d0521e28eemr129825435ad.14.1785841637856;
        Tue, 04 Aug 2026 04:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:2c0c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d0521e28eemr129825115ad.14.1785841637429;
        Tue, 04 Aug 2026 04:07:17 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586401627sm4834476eec.10.2026.08.04.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:07:16 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Tue,  4 Aug 2026 16:37:14 +0530
Message-Id: <20260804110714.2951829-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4f4a90d0-6ce1-4d99-9d9e-74678855a717@oss.qualcomm.com>
References: <20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com> <20260723-master-v3-2-3d67b79b0515@oss.qualcomm.com> <4f4a90d0-6ce1-4d99-9d9e-74678855a717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a71c7e6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=igHyRETPZI50f7faVAsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 45FmgOSwzh1voOGUStNX5SZN-brMUhUc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4OCBTYWx0ZWRfX11QYAyPY4HEz
 T7ZcDQ5GbaEHvpviRztVRQckszRBDdxOmmME9CQQqCOi073MfAFnwz32NSzxYjErmvjxvC+D00W
 1s7mmHvxlC9a7ldA86PROkJWnu/ddyo=
X-Proofpoint-GUID: 45FmgOSwzh1voOGUStNX5SZN-brMUhUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4OCBTYWx0ZWRfX4kBJl0eiEJLG
 zC8sJNM08HgllT9QhHjBjk80Ere04fT9ekW7TIUpAiXFlQ6q3VnR05Bf4huineP6rMFMUrTRvpE
 9Si2r2ddoNykKCqaO7caIyxH47IwxlKuSUZjsS9Adi+g1K8exLugH0YeK5QTZHu1TCGPAYhf9z4
 1OOJ5X5r+Hs/NBidCEnz3kxr2Z3LpvQCrJTFB4RtFfVqkyneu4XIP+lUYZk9TPCzGDkiT4L0xNM
 TDchyxz8NjBQ27p/8Up9Fj4IYhzqdBgrNkfEJHd1Pa0lsB8m2esmVKT1qWeDK0eXFWmcNNgxKxT
 gUBI2IS+Z4JuXjtSAFslgwKCgLpCjkCBxlxsBrmwcG4EQH3GyJikUOEJ7uOuxuo8vULk4FXGZLM
 oOCpELXidwvxzoItIn8V0xf8B+wV9tjkFrm2sam7jz7gxX2aRS5PjPcjxjFH6FymBCCssdyYxFH
 uOA3iJ2g2iqcWx2usxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040088

On Tue, Jul 28, 2026 at 02:12:07PM +0200, Konrad Dybcio wrote:
> This patch spans 2 subsystems and 2 separate maintainers.. we'll need
> Mark's ack for the sound/ change

Ack, will cc Mark and get his approval on next version.

> VA_CSR is the Control-and-Status-Register space of the VA Macro,
> the name of the config should definitely focus on the heartbeat
> pulse clock generator within it instead

Ack. Will rename in the next revision.

> Besides, that address space is huge, yet you're claiming it for
> a single simple clock. Exposing anything else from within there
> in the future will require bindings updates, which are usually a
> tough sell. Is there anything else in there that we need to cover
> from HLOS?

The only register block we need from HLOS is the rate generator at
offsets 0xd000-0xd010 (CTRL, COUNTER_0, DELAY). Nothing else in the
VA CSR space needs HLOS coverage for hawi. Will narrow the reg to
cover only those registers in the next revision.

Thanks,
Sarath

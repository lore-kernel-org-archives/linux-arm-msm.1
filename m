Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00D386572
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787334575; cv=none; b=KDjJ1a72zV7F7NwIHeG4h5AXzvK108iKLUACW/zXmEPj1OO8SU/XKorraQOykZNkFVWZnEfTjs1lLWrvNXFnHGdq0HePMttDHgfoCofG5SzdNJJ/+MFsIfw8z8w8reZ9symOYtaRUFF+2ic+qNMpbtZjqNZI0uD0y5mW6A4NT5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787334575; c=relaxed/simple;
	bh=Z1v3R6gFVsvXS7LKLNA+syvnWhUGdu0IqSV1HDd9emA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyG/1e2pUrJo/9tchBY/Rwd5hqNScE17wEAQW/UuJA2Ytah5CezB1qjbAA+ENTSVYsQH034HmI5Cg7gxFYbV+n5YurcfQipTZfzKDvIw83NmeFXjytRDh8QBFzjNfnichXrDj8DZoLGT04BCojZ7iudGb+GyZjfV/yS2etsJMtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjvYsIh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRtE2uds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjvYsIh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRtE2uds"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmr7c2417765
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 17:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1v3R6gFVsvXS7LKLNA+syvnWhUGdu0IqSV1HDd9emA=; b=HjvYsIh9w+nM39+2
	QtgvMZjAyuo5GruNJQWlG0ea1Xzu5fmKJ5GFs5Pwk8m/b7D+dPEJnbeRXvba8rqt
	lXQMjbI3sLivnoQQBGoPXBF+qFgIGy9PMX34+jKq7dChP+RVjIHtWEtmhMhx1Cqa
	r5K4W3WgySgePxqyneDRnIZPUlAxJztX3+W1uOnZnfcRUspF6m+voZ/iE/cqdG8K
	60grQQmlHFrRQeThv/tTpMQl70R+8BZteVxppywdZDsFwjKs4rJtfgOqaDxgnoj9
	VSShZxPhxJGSMQ7CfXj8NBOAed9kgXTE6jbd0PvvzFUDotTf1RRQxKpxfZX8lDsB
	CTTwPQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue2ya6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 17:49:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1178278a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787334572; x=1787939372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z1v3R6gFVsvXS7LKLNA+syvnWhUGdu0IqSV1HDd9emA=;
        b=HRtE2udsA5GdOAcLySQ/QX7KwQkv0Sb/zJuckTaCrhe59HUMpg//qok984+yabTTny
         Xk5hBVOU/IN7pbidn8WN1weECWP5Z+ctmmdVrrt6SVbKFsmtTjQdbIA6fWCVmWAw5TpD
         fLBtbsFiBbL26WQN5TQgS+UcnRfVdlAUKxRORvavbA+RLim9fAAcjgQB0GYC9vCXfu22
         +9xDesU8fpGJvC3nzl/CTx/Wm8VY3piF6nprGU4+hdZGKM0NVR8ezIF9s2OE54ocFo03
         SOtYcrr9CJO9dq9j3vOPYOqA0KeuVjjMtfHwMm8utxNANaNTTbLkr8KOG3QW5c1UIjtg
         ZV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787334572; x=1787939372;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1v3R6gFVsvXS7LKLNA+syvnWhUGdu0IqSV1HDd9emA=;
        b=RNT0Mw1Ful9KnEaUKNnY48rKU/Kf67B825hOK4jk0bHC9BTozuTo6WjQpfulJ7TfBN
         fIA19jUs7evWR3PrYhit9RfyhJT+4fbXCw2HywawA8asFoMxetZZHGZkDoAwvP8fyq4t
         3rxIRzYvMZKj2zEH/Rhhb/Xs95/tJqVwjjtsdtk+tIm6Ju+RRY9FUqg1YWfEZWrp4WRM
         XvB0P/VWItibhgmJ5WqBXHDkAeMV+TQFgalFPg7ISuVJeC6gSH77qX/n3rydqV/5pUl0
         KO+7lpoMLpnZrajWfm7s/9HmdolMaLBqTlj97hFjk3XX71ixGE9klpsfEjVuEu4vz2SQ
         M58g==
X-Gm-Message-State: AFuF++l0zpUKwvKZTzXVOpoiPIyPNcmgTtzjCMyDbaVRL6ps3PLQXFOw
	e8jbHNKVjcY3zX78+UYJhEF1/QjU64XOHie7zCxLz/aBcCpSPmijucom4tnBR+P9IMe+Flk4EYo
	GXMLElR8tRvpVgf0WS0MsRneKHvW/RlJ5+x8TcAWzNodTFca+ZhQhEz6GJyiumGhkD2CB
X-Gm-Gg: AR+sD11RQtGCAPPNsbsgv9Lq5/UeEhocfwpQzo1zjO1fpNIJhwqrP6vroSbJOGDpnoq
	YKOepljD91k6e+gXrqPj27SZ9RUIqHoIfabuTk4JIt3q1tGhcnsVUU7FOCDS3D9Yn9TjzB5fTA8
	IDBBVqDMEC5q8G/SCTldNTz/uOl8VdluYM+2nr6YQbN3AVg4UOwRi3U5BzA2GkjfxlY6/m/luow
	8QsWfVMDrZyAsvX1lJ4JzzuVMvuuWXspuhlHL8xwUaaj3Zlpe+6sBu9iPwr3pGco0d+1wLCjZ2U
	MKs2ZtSK79Afdf1hZ3zKYobUlnjx9Q6aC8nszwCf8P+0bjhaLdZzvVvsYjAzCkq6jj/HN05gsam
	sm1raBaWxzatPhiOukg==
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr21129984a91.2.1787334572389;
        Fri, 21 Aug 2026 10:49:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr21129936a91.2.1787334571997;
        Fri, 21 Aug 2026 10:49:31 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb51sm30691047eec.6.2026.08.21.10.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 10:49:31 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
Date: Fri, 21 Aug 2026 23:19:26 +0530
Message-Id: <20260821174926.2096826-2-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <22918a4b-f972-444e-bf2d-f3cb0549b8ce@oss.qualcomm.com>
References: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com> <20260806-master-20260805-sync-v5-1-0ff42e9b6431@oss.qualcomm.com> <ann0rJhd0T6x9iLG@baldur> <22918a4b-f972-444e-bf2d-f3cb0549b8ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDE0MCBTYWx0ZWRfXyOjrvFx/Lkax
 ulaPkWMIUqGho0ei+NAxFok7xoc3JFY3vLHR+9tper/jd7T9kZXbECae9TW3EXwr8sU3aRWuq1p
 Tund0fqyE3n5vSCD6To92yj/l6HYcNg=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a888fad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ekpy3RUg1yARM-6F3TsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 91y47IzvlgE31fjVYHC2cgl6YJiQ3Z-t
X-Proofpoint-ORIG-GUID: 91y47IzvlgE31fjVYHC2cgl6YJiQ3Z-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDE0MCBTYWx0ZWRfX+X4lhejsGYpn
 +AZK9gBeGCNtFKDJfaUuGnepWb4W6oPpadyXuA83QwNC1Cd51pclliEytnkWVXH4KmElnBJ5uK+
 ZYT5Vs4tAIsYLLHXOeFTioG0g0ecNUw5kjNOBpI0X7BU0TwRnWsIAhVOS9ytd4MVTD1/tYfBF7n
 kJeNWSWhpeKB0S6lqGYuF4iBYTo9MhTuBAo5AfePPNK90oX+Zlqz9s2SyctcrrldvcaQ1F/ixaf
 uVq9JRV8c2XFnc0WXcwAT2O3L3h/MsvAkHGiCpdX4TY7G6pXAVPLt5NwG/IuyRGzZ22VRJOnuBN
 LvWiRXaGlyihzV4QnFFqpRDfa6TrqAoeMvWq0dT5cwFLr434ZoMPJfv7PiiLtgvju2axuFmIMpS
 X7MrAayG/kHtafbMDwNWpIwzYaIFxu2zBwFlMbKMQbrBDI79u3ssU0r5VE6X6EfdCDEvADo7dhR
 5wno03sNv8NO01hCfWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210140

On Tue, Aug 18, 2026 at 03:40:01PM +0200, Konrad Dybcio wrote:
> I raised a similar concern, but it seems my concern was misunderstood

Thanks for clarifying.

> I think we should still cover the full register space

I had narrowed the example to the rate generator subrange while trying
to avoid claiming unrelated registers, but I understand your point that
the binding should still describe the full VA CSR register block.

I will keep the full VA CSR window in the next revision and make the
binding text explicit that the clock provider currently uses the rate
generator registers within that block. The driver will continue to access
only the rate generator offsets needed for the heartbeat pulse clock.

Thanks,
Sarath

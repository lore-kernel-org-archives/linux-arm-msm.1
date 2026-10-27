Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100969;
	b=BLJyU8JCJaBV6myZe7sYAA29Ot87GSQfz0jwCE4ycDrrBEGyKfcwWm0tG7kxSRrzOqII
	 FsPtCvI+6bX7Y7rdllHPoWtimVO5HvOCQdi+41TFXbe06lfl3w9WC0CWGYNwqPlPH5dV4
	 XatC9Cx8C3H6/8ezwiKx7+STYjx5k7nSfjcmwok0VbJdtCl1qUt6ynj2XcFFZ03D+/ABg
	 1fTE/vbd3Ry5yzJGaewr0A6YbUW3JSOZx1hFlC9tgqZgiyfSS2nx8DSxrOOXHWKGGpNDL
	 7NXh7hGhdYP8M4DZvyAFV94+TF+UESls7qED7tBYjtekq9/suiwSYyhWgwW2kbx5wzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
	b=jC0SRtqGZn1UjbOctJuSHwCGg2n8kSQUdNoK9qFx7HbgweQL49q1vZOjJ3vAql0uzLVa
	 ZZNWUrsThFo608+6Ko4tapHepxz+G0AjkW8+14wIrsX8M61fgkE4At79xHhUPUDYzpFQd
	 ATxcjwDiuZsiTCSv12euwICrEFpoGq6zhbRaMVITTESRk0n4iCD0lwdPQyUc/jfITbNSj
	 l9mBuc6yxRoWg+btdpsG7pPL6YBmehKxHiX4hIKU/ZziFTcCAHSTdqU4ZgUcwQ+5X+CUS
	 T8EAJONSfG/OPQ0VqUM1C3Sssl45V887TDXn81kvHVuHxXkIbZV7IXQeE7ZgHhFDRbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m5Of/TFa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6tmjqWW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC70606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC70606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m5Of/TFa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6tmjqWW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeAwg894518
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=; b=m5Of/TFaHjpV/k/i
	sBMq7iQgK/8z5bGBKhxSYwsasXHfk84q5EBP/I7QjG4mM+PMz3hC2cNklSa8/YsF
	A90UqhCcVvcuLHP10dlzLfsPPrtc448UI/33qk5WGQAXtWxTMyOvvBDBgQdUEBCZ
	mv061gbRpFJQ+ZbH0CSYZfmY9reYEhLM/EJDT60frngj7YmHuNmr095TyLNei7u1
	8GJwVxSngHBESXq1wZDN078KvE2PMczT7NB+I3iiMzZLAIQN1MrSHdqAFPG78GSw
	f9y6ftPApYrrnwtw1xMjmroQu0dth4Hp4UOU5jx/jJ1odyI4PgKm/Vun+1wetoC+
	K+qeLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smv8p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:36:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943fffbc5dbso3567885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100967; x=1793705767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
        b=C6tmjqWW+H2999aoEoJ5EmAh8uz5UY+6SaVBGDDNLza2Hlwa61VGwFq0pXUuwHwyd+
         QuJ7rVyXxM6jlcDcA/eZI1S9pDlYnhKVCKOm3Rq8uMXO73JE6rPK8o/P2gG0bg7uCyqy
         SUvXAswdG9Z0DgN2xqn2IBdfaKI/MW3IMuZElJSKwfMWydIwC90E6f7qHQcTZOMAxnt5
         Ii7Q/01lnIWMbQNKqjCybOH0vA9rlpMYY7rsZ7B75rLJQ09ztaeR2FVv4fTPMoL/W96N
         Ysz9mbBkVyplGd81JFqxqTBlSVNv/UaRSCLZ+xmRU0IWkZKxbI69UlotchpdyAXcvifQ
         J7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100967; x=1793705767;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
        b=W1bX3uc9IheQee5Nb/BOIl2d6PWocmy6WzVLI1AVVUKxQ0qZ4YhE4yoJurhXQo9w5r
         lMBKjWPKDKctmxOHdh9WEFpjL4YG7B7O1fsRumTRgHRi5eQXV+Kj8ZsIC7sm/RvTv/zO
         rWTeT1gFmX2KkVpaHGwhWOEd+v2ajxT353a5mSUWbJ6YGvPMXtUEXvEz6LGzfxxxQv30
         9dUtnzo7z//Juu4O1AqanViLG/BpNEWLcwiRIysrZodpLY+ThXifo+fjCKyIU72pKQ0S
         zJiqi04fX13coAWvSs+2+Ql0TPcDZQSwEgxjxwOsCJBWnWaANUXF0hh36/RS6EVb81aF
         kHxA==
X-Gm-Message-State: AFq9FYIKARyu55hdtkgqOMDUPOy3N1gDJPEahlHbUYPZye8ulrDxRoHR
	Jr2NzElb9DCZl4iUcBKYQ6nUA6JJNrM+svEjO/Ma7NeAlpCov4HqpLa1TrstyxTajQ1zFBTq/Pp
	3dWfCl1Tq9afFolHGUKdgOj8GgCejyxxmSxx/1ZdRfeaHbdi+irJr82YtZruQc3y/tScE
X-Gm-Gg: AYBFou2VcNQsdylR7+ngugFS9dK4WCAJ7Fh303/Y9dsJKicKwiyHvLMkTWd67JQqpQ6
	JzY4EDz+u4agdc83IGV16q+8JRcAoOubqdS+5xS9WuxG9pzfkdDDgMqsf1UTdP8UY2xFa05r37h
	kIMlOAS7mJumKGOAVwAGFO/aRUpEZeZRY1esCNsqymxkwGIp7zFkheWp8Vj1/K0uxoLG05hqreU
	K/zsF7Ol3V8QOaj5LdC37Mq2DP/xqyOxFGWNAsH2743cw2X31MEbMaI4s1/TbS1K2K3DNTK2i3k
	uV40xHnmj9GkRWvWUVnzUvvjNaidvWj2BC27BNO6Ne38zqOn9epN4pvrtALY9B1xvVvZDQvqwuu
	P+zht4emDN76oJTs7XNZqpeoru75obq/wVQ2NwS/J5VWdfnIAUf0Z5LV99wnkVwgWiXmWIfc=
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1747739585a.4.1793100966908;
        Tue, 27 Oct 2026 04:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1747735385a.4.1793100966390;
        Tue, 27 Oct 2026 04:36:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595df8fsm4956195a12.11.2026.10.27.04.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:36:04 -0700 (PDT)
Message-ID: <8d14b8ac-3f7a-43b9-9f7b-c37ad55c413c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:36:03 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ot9sQk_cOij3OU35y4kzK-LsVTb_cdy0
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae08ca7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Ot9sQk_cOij3OU35y4kzK-LsVTb_cdy0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX2ib6RGhTaHRI
 zpEAA/VOX6iokDG0LOZkeiu4pvTVaN69bN9AP5BYv/6Ht7x3ZgJpKPAUMEy036WqMYM/CcLNnWH
 aQID7dHBe70/4eiNJzJpY+mNgJByvgE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX9k+JNN8M+dfr
 0rE9TsHD7ACHuhAeLkCGv3ip/vISzdvseisf69y2Uc8ZWoExA+FxRKl4saSQzidr6MvuVpSE/RA
 v6x6o1tHdEhc1r3cirdO5+SOPTMdqWdtTZAeL5F628X5fCEtpTYM3mRkWwTyknepFt4dcjk21Sf
 8XdNOwUeZrkBjhxQMxtBT3QYcBX2zuI1I9K3vBQxoaKB/fjK6SpdZuF/7RqMjp+Bqfni4aAxn1N
 NeFmnLJKMmWd6iEDCQfzeWjCyOccb2mMn1pYuoti8dFV7kS9uGloZ9zss3/4rUcbbCadziu6L4y
 2oQb/xvqBcp/0vBAzkGKwQnKHE3hH57XiktW8F2KDTRjCx1MOdljASBX+e5a759Oz9g5wMRGzJD
 BdhuBZaR5xAhFSK99pDQdSB39AO0IY89JRUdmlS0pN/nAzg4+ZLPEEDPmXLyoC9LBknq+KP8RF7
 fHbPX4DZDue59cJn4ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270046

On 10/22/26 1:57 PM, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

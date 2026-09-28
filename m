Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAD47255B
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583818; cv=none; b=dSyNC12Xwtb6t2G6JzeQgJJfyqMhAVNfljQR9VkzWX/mtS4bDdF5k56C/gnjb6eRzEz1UNXvmptrpN5SvIwyolBYnpabnVxQ8TwId6ibiU31WJOIasD4bg3QWYJwsXtR3Q0+R6+3wTv1i+qo/14gKdqn4hlbBxzIk88bbEiSXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583818; c=relaxed/simple;
	bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITx9bXljFeygHe07YP9AzSDK5ZTTuDIZ7Krp+WK5JqRm4wmc9zbea55UUE3C+C3nKuLzBHvzXvJYh3LixGtsC8oHvCjX3z3BRV0FjKpqWjeeEPp+90gcoEuTzIzYXuZn5nYSSIyj8+LanMHBc1qmTLC/9yBRTamG5V44x/1Es4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juAAtRwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKZAqTRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juAAtRwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKZAqTRw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xPa1137010
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=; b=juAAtRweENLBLmQl
	+ERIaFv38jDpKH+ICBdAfD15GUU6MRom+B600xtPxx5fqSqZaWt1Uy/I0oZGBOZZ
	7wkuxzeBpNpHsvXLSvzbk14ENd+41hpnYr6llQ6RJzBZHwwWj8AktGcrPXHt8QPk
	pCWQj0h/BmA/DhKvBdvuA48aKs6BXeNNlEI5GWIkdDghbMLrPi7pxkQICDnwvPGz
	i1h31ekTTmYEkHqIwCN5y5F05IkToNx5o4D0hGF49uVgTAaaiacOi7T9Nil1LGfD
	Lsph3OvkYabzJjsNp6+48X33NzhxXjyoq847itdW6+g9C5dM7U1G9ll+kf0JFfpZ
	zDZghA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq178a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:23:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c57e0436aso182265885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583814; x=1791188614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
        b=YKZAqTRwxjR8SQgz+L0gPGn3ebMErxD9xVB5mkRTk+vgDfjMRhoVmp0AZS7z5grxIC
         E/brlVP81rzUY3b0JKizWCtETM5y9yow9qIFaHeYjPNokHwZb7Txvb4rmgW9l9iP/8pY
         L3A/vhXIMf/G57Vj+QM0nIyzzgcGjEp+HNYtA22AghLBVIYZJ+1/eV4BRDw0AISRMeJP
         0lY+pA9m19vYsj20kOmu40fdXWU6e4jcr6yibNXCf/MwFF7jlYVccYQuZNHV2MusanSd
         bILdcgzOLUKwmEqoqKq5we+W6QyWrzT36BLrDZyhEZSRTRU+eHVcCm8aHFGj45OcpzXW
         znSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583814; x=1791188614;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
        b=gYYD4mRsRiSXcmx9YGKaASaiEHd3OsHy5rQ9KN2cHYqBjk71a8Vh6UoT8Q8mHI6gSG
         4R571SuwrxqoEJYpFrpaz6vSNuTO9Y6TgMQeivbEltLCj/pYUYy8oc2NBT4u/N4hSPlN
         SlWmwx+Cs2+4tRu9EywXqnezwe/o9otCNRpSofxmNeAe4xuKETHp9e4V5xYt2/VYx3Ye
         EI+yO0BkqNws/HXd5UoiOrjis6728sYL8YRl0ovsO4iXOfuvHFXimCdgNGS/LwjVHAtR
         H4ssApptZ6TXvQUg0BJdIIwaXrYxqtQBmmi1AuJHAJuN/GetGPFfysawIjJt1fWjDnwE
         SXZA==
X-Forwarded-Encrypted: i=1; AKwUvBwxe5yVbY5lpVGdy/qDD0/rBViwUkkeP3MmvC942X7DyEwiP9pvoekgnndUfqCLwGla1NA47e5Dwx66cKQI@vger.kernel.org
X-Gm-Message-State: AFuF++n/0b2WNWxBY+co8rf6jJ0/sTJDxsrpBSdGXsrMA/lY4LlPm9dU
	JTGl0GW3J+9MZpXQqWPFiCOG1TDkixH+Xzx7Wsh25dLn1RTOY+rKUYc/2iosIb3x0MLH8De31+4
	Q3svb48dCws3XCAIoJ2icbUk7OYmPu9HNW/EEIpctgjk22+iNro9IgBaXVT2zuK/jyW38
X-Gm-Gg: AYBFou0ecziJLdRf1sEdcArG+LJzYr1wVP0lbS2PporhTMIGoKvSphRAGJUWoRWg0Ev
	MXQrEIL+yry6Buats+gCWigN+OUGk5O+4TQJgyWa7jMm3TlaYDZNyc+Q+DEZhpZWZ0A585UPGQj
	Ijl1lIptbQaYNyBUg8YyqH79dhZloB/gN06YTokMfgNDG8WuzNpjL90zWfJoTdW0aWcBkglTZa/
	FCv00glhdA6UCgifBy5moKDFJCyeE5GB5S19g37YU1NnZj/Ljn1YZbZ5FcFL+nXQeYQ8HE8G34i
	vHFLKymn+JzMVneArKaVud40PH1MuQEvhnWVhIFiepOO84p0IcapwMAWRhhSn1fu4+/RkrZ+8ep
	tua9kO2drk/rOo6rIZGUZNPTiZVmH
X-Received: by 2002:a05:620a:29c6:b0:939:ff11:5328 with SMTP id af79cd13be357-93c43bf14dfmr1902392285a.24.1790583814438;
        Mon, 28 Sep 2026 01:23:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:939:ff11:5328 with SMTP id af79cd13be357-93c43bf14dfmr1902389185a.24.1790583813905;
        Mon, 28 Sep 2026 01:23:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm20537165e9.0.2026.09.28.01.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:23:31 -0700 (PDT)
Message-ID: <27997939-f39a-43aa-a287-44c9f70b8a51@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:23:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
 <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6yTXqJ9cBBoueYmYVpH8HyCP1rAVLIbB
X-Proofpoint-GUID: 6yTXqJ9cBBoueYmYVpH8HyCP1rAVLIbB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX5Y5VkhyxWN1D
 UA+ra1NG21FK1BCt5y3tnTfPx9PuGYoGbGBRTS/0sNpKaucxzaPjXbaUXFS3HPGrVG1JA2UMYNy
 zPk84VREtVurtxDZrKliuXk57haUFEc=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba2407 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eawAJn3Fff_qTO2XkYgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfXzVrohbuozu7u
 9cULKKys9FyI6Vfq4xfKtW8QYnG0MOpL4ow2IxCRyScRG5/NH28eo3RXyD4KOkKN824GvBTTeJ9
 DzaRwk5kXIeM4VBzYhKWOj5Ow2vry6C/S+SBpb8anHG0duZYjyKkpoSDtPfd7SOHlaZbsRylBZ9
 DJvCU48bj1zJBl+xSNRCq6/Z7oWPrW5GMASX1U2ogMJ6RpKbmSeD5KbkCxUndRHVT70Mt+KSxzO
 yvH00ZyRZhgsQ8USWZbHv6+qa1NgeTpxlg1GiQPmSrtL+sjikVka2XQ2QW7WcpqoS25y01GPEj9
 U6OuHOxjy9WnTIoNYD11VFRhoujnVh4EvV/VaoBSYRJmRmqodChYhBnGmpH4+W4310jQD/noypZ
 sHZ01ZScGlvd4wXwIQcal4GK4bseXZiEw2vgsT0pf2yc7mT4jTDUkR/8GWcvIFtHBL0RHMUE3tW
 YfjgZxwkFESTjzzubXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280033

On 28/09/2026 09:19, Jingyi Wang wrote:
> Tested-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

NAK

You cannot test it. Otherwise explain me how did you execute this code.

Best regards,
Krzysztof

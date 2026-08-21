Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3A3C3F76
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329922; cv=none; b=POkgMQuy8DIPvT1qyri491IROIA8LYZ+F1/tOmMK5xFLpqv/oJldHMeNdhKqj4gCayA/L6YJ3njF6ltEpLMO/jvub2vP7ToXHdP3509nIobiz4Q0KCC+WkTMTNdK4+e8s8U4g5oDsyumKrN0B/PCiNeUxqAG48a58wk7yiARChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329922; c=relaxed/simple;
	bh=VG7yF0cdpuvneMA3pXbJ+/TbeQvCqJntYUlriEI9dqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YC2KNxBdiEXniA1N/I6gK7StEzuMb1j1xmAxuEaEP1y2XyhANMISFwCDdOAD6VVIFJ+T+mWeuiCANTIse3Cta0XmcXxR+yCBZH6QDI5108U6N4uwi1TtcPHOlrC9rJkCufpld0NSj7pk2/CMS6G2+FRY7CLMhVSZ/yszLvREMEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQ52QDXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIykATuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQ52QDXg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIykATuS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm6NX3876546
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R4O0OJ/81M9dkWwz2jGlLeqn59+5gBvGJ0ylEAUbO7s=; b=jQ52QDXgnnAZE6xH
	vb49xvWOkDPju5bjoqMdSCfId9aIT1iW4aGtzMYypRXGsqBOTo6bP8lFfuovZqyd
	hre5FGP/X0mf1P3kb5mTNTuZiQSifsUNpOVcIfTgDa2UMxVLVYsxJCA068+k85gM
	+b/efYW9JVaHakBZLnL6F3gXhYmzOIhSEkgasEtP5QAsyPBwVkxXLBeq8rg8vhMG
	26n/r3U1P7ul4A7cHhX/I2IzTpa+UrQ+zuSs7Dd+sPJcbUv1o74mP7gKUDNzWmCX
	o1vRiW6qX/k80nnpf3KiS5CnJcQrOv2Xafs4XZKcA/wUWPOIlkIMmbLKhM+0msbu
	UrpQkw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9tmsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:31:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so1487226a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329914; x=1787934714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4O0OJ/81M9dkWwz2jGlLeqn59+5gBvGJ0ylEAUbO7s=;
        b=DIykATuSrcSUUup0FHoqObNEegKtdQxvg5fauyTWkgdZRCPYGvUyfyRZcNy4UkkXmy
         DqSobOI0lsiTSxDNPES0hRfoAMcOAJrhX8ySaqnJMpJo3Gqlf8EXRhihJgfGdFn/Ur9b
         6Xe2QFhkfK4sJoR6xvJU7Hk4iO6MYFC8SHXC95iZsixN6GnpuuACv9pIJESdz9IHAOjn
         OrWtSOXRxaVceQuXQkqSqOKP/aBDDa9jRFe3QsfeIYp8Co/7+bh78KckITMRWvn/pJwf
         rG9tEILBcXA65WS1q7JYV00wxPXOsZcn6rqvkqoHwtxmP+m/l8qKJ9QP8wlpjzrulu+P
         GcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329914; x=1787934714;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4O0OJ/81M9dkWwz2jGlLeqn59+5gBvGJ0ylEAUbO7s=;
        b=B1OxPjyYzFumfW9RS86S8GFFnYJQLbwQFNnpYDBBqPCxuoL0FMBY2U0rzk6I2iOzSw
         UwQ/fc+D7EadZQJy2cAEdie+szpbiK20KiYS4WbGUxi5EXDRbpTQf8cRWElrPoggvKh5
         1Y2Xl06iZ+F/ULvtSto/P2FXC+fHolSBvrbsaNMjJcUwa1SLj+jZBUznTEPfQQkaC/X2
         SKpDAXxAi2mwzmfdKf8aVkZJMNHOERd5G/UgX4r2n8G/SI0U1IvORPdSoyOLOcbW9hWv
         IOA+GoL3cZURwpkqYqjPSciePxzlmTkF621Xvl41ax141hmQ6gCJwzqTSfB80ARJrm9Q
         CTsw==
X-Gm-Message-State: AFuF++nV+GiUg0NCvWx3SYEb3kBTSGCikAf690r1trQ91bKDd1J6ZEjp
	A/ae7MRvXqg6Z0uk+NmJ5B63w1nBHFjbOdza13RKx+9pv3eS73Sz7TdSiVWXt8D6jaM4OibcVZ4
	UoZ53Xzr9XysU/7gOkm55oD/emcupvvGR1YSl1pY5BV1oWKvTZo1OKr083/0cKT6S+ndv
X-Gm-Gg: AR+sD11i2+Gl14fICJsQeGL/0jCUfDq8QN6oeFVkmTFnGIV6x07rjjYdzNanZ1aYW8p
	uG7vFNOrwLgu7UAnkzv6GQVdH7FRzX1MhS5vq1tOck3d5ACn/RPvAHERPi3GnM8bznyzKqm/fsY
	xU6QKxaU7V3IoOL/w4t5J6AEeg5OL9cpftPZNzEp+ETtd5JsvTHU90K/Co03hbuFt3h8FwwAB0P
	PDfi+fEg6pWL2tWBqA4bJ6sr0wAWTSSXdceGOo+EmU9WygUS67BqNeVNLhP4iwMyeNoBWVXcTbO
	sl9Y41YN7Nd6LGqSxt59y+9C9s5ZrWSveXg+8q/Qtl45FOPhPg6IiAQqTOElKAVaT3Gh1pC8dbS
	Eo6lCKa2gm9VJ7jleFH8kw35xj87VLnbh
X-Received: by 2002:a05:6a20:7488:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3cd4b9ada5fmr172441637.4.1787329914126;
        Fri, 21 Aug 2026 09:31:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3cd4b9ada5fmr172342637.4.1787329913562;
        Fri, 21 Aug 2026 09:31:53 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1593060e8sm3062402a12.32.2026.08.21.09.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:31:53 -0700 (PDT)
Message-ID: <9e91bfee-d0b3-4141-92ee-4602411aae82@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 22:01:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NSP Images upstream for Nord Platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        kssb@qti.qualcomm.com, kpathiko@qti.qualcomm.com,
        vkraleti@qti.qualcomm.com
References: <ca4efa2a-41c8-4658-b386-0bc691e95179@oss.qualcomm.com>
 <kug342o2og57tdhortgabobe4vdjn2jkv3bxoqzfei767neg27@46p2slgpyj3w>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <kug342o2og57tdhortgabobe4vdjn2jkv3bxoqzfei767neg27@46p2slgpyj3w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEzMCBTYWx0ZWRfXxX5HiSNC1MWz
 UZoR+Mtb05o77Cm4MY5yPhyXe8WrQz58kFB7hPV/SAjJxh7A3FEWFnOKlQgN9N+M2Dl4/TQUiRt
 DGXVu/V+ZSQKG3viBwblUWVQZNQLt2KT0Vgq0h2gmdB1OgcyK/i2j43K5LewnbG5jqbyKEQRDmz
 Ne4FIMYRN8+Sh+aCGrPcikuDis1b/1MaFwvuHPvt5ikea4CjgtLSw9g5f0BUTofvHKZ9JO7ssQ3
 6FU2Tc6dhS0cfJLlJSh+Qx7JEqfT6Ro+8BlhV5BCna1Y28L3uyGd+d3YglGp+gFsUDr42Oouu1K
 RuMLwoS9FuFYvTDGwmS2/z+b/PYtT0zRcgoHfXIGd4S+we4/RytxvY35aNHG5fLDrfnGgceK/Qr
 1jehwglfLFhiWx1flVgsGKTLg6KeEafbD40gArwdS1QvnVQYL4oq4WO+lx7vW0aJA+6KloOQNs6
 iHmqIrjcEs2QpB/LZEA==
X-Proofpoint-ORIG-GUID: yik3SgAH9nEt6aO8plYuadlvdklK3_3q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEzMCBTYWx0ZWRfX58X2I+D1Cjv1
 dD5x0oUl55IggQjWa8QxVm5HK6DRhOovQK/pDEYTH/sGPl116vuLU9T8b+rgaeiEiKOXVgj6kz+
 U1vt8naOCNgWPHUaZT9NzyG21dD80fE=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a887d7f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=GcZ5euwKFC-5tHUCNOcA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: yik3SgAH9nEt6aO8plYuadlvdklK3_3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210130



On 8/21/2026 4:22 PM, Dmitry Baryshkov wrote:
> ure segment to a separate file having .bNN
> extension (where NN is the segment index) and make sure that mdt_loader
> can load it correctly, possibly extending the helper code. Use symbolic
will have to check with the teams on the possible implementation and the 
timelines in which they could deliver this solutions. Will comeback 
after talking to the concerned teams

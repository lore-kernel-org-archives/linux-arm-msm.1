Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447370;
	b=4o4iROSQyAwkZELgpZxggC0t3Ev6KmitOMB6pad6VfO+Q10VbO2N3Y1+6r1P1YIiW4cZ
	 wcvw8WxPhrlk2N/eiGonZt6wB0Qp8SFdot3sZnJfXRniUXNtAh3FokQByRKh25OJB0nGg
	 UjayWibiy0muiZziZHBDRYJPt/63ZEwxDHYife1MsD3expyXKwcxJYGmk8WsC45TRSdam
	 6nMXxG4LSY06TXGCKOdUXNxXZEOOJkJwpy881BxYc3tv/qOqdNG+7Jquwc/5Cf0Ff/+od
	 ugb0vlP8n7qWLrYJYuF4AXTDJHdj4+7e2Zi2KwyIIZNmtf7Qst3+rBA7kVRHe9BY0HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r2xGVo073SzvMjgFY5O4vhbT6qflI9yzKcYvMb8qD1c=;
	b=Hb4YZIR7UHq6rgx5aQa9VnISD5sAIcgOLauHFZriLB0ALZZaozVv0Y3NQZfbca6POhY2
	 altcIlZq+6tJMQZZ6ZqI1L8i1YTZphXiZBjkMc/vJ2bADTxsWjB/nSlDHP0hvKpVn0fvh
	 SeA3hOU3drkAFcWdTt2WThTA7gHS+zMhgQwozH+U8fNWqexhVOTDQXHajHFlu5xvilRAb
	 8OltLFQpyoLtaQ4uj+HCNURwU6yKgEZRs7kkcAf2RnyIIOMkS1SBaVERJk4rI3om/E+/a
	 +mXvtoEddvOzZe8wPb2lFw4LsaZxj1/jcotMB0WO/nJ82ETgX2uOLvpghE9gOqLeV+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LB2cPdUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6utw2Vw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4056606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4056606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LB2cPdUm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6utw2Vw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL4Oj3072614
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2xGVo073SzvMjgFY5O4vhbT6qflI9yzKcYvMb8qD1c=; b=LB2cPdUmJlyGHCFc
	eGkrnkQEJM262ipiDDR9nnTOFGEvriK/mewuu85pe4tGE+XPkEffQAmanbxw7ip/
	ZQdzPKOC5Gb/oI/bcjTFN7Bi+pbr9eIXctpd2pTLA5hhWyOl7cqFSTI/rBeyJGRG
	Eezl7D70MSrUOEQcLTgN8HDJAu+DcSoGenhu4XR6CUdwEyhtuZELpXKm7sWoMAKd
	KmnOA7rJVmqi+cr6wYkmD9JrOXvbyKkNr7yK2pAKvYf7aiNJgTP901gd3VZIbQc+
	/SsyA2+nPfdI4tNpPi8/VzcHeqVuH6uWu4vEQYV0q8c4YHJmEWLN9lb5HjqC5hAd
	VeMDtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7snwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496156f74fso32210085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447368; x=1796052168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2xGVo073SzvMjgFY5O4vhbT6qflI9yzKcYvMb8qD1c=;
        b=X6utw2VwUjNQN8VLWnIpucMXEPlUlWbCmiQ1il33weES018A0CB9xP8IomJpXK3tvw
         2pTsNcssYyHixar4zvLbrC0FnU5TVk8Yldz9yjzzfUXb8uwQ+2n20gIcPK/NYlomcpgL
         az0DaxfDydCgoMPul1qD1lS88+WgdBs/pVheSgIi9085kzh3C1H8Xrbp0VAQ63SA6Nci
         bHA3s49Q87OypGCThsVgKycuANJxce54u4Av44CD4OCo+EfpIjJJGhjVE60hihV48Kuu
         zlC8/CVfYEew+diMn+V30mvJ3muteGsWAokSHz2QBj77i2B9CHTBriyZj2r7e8WTj1GS
         eG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447368; x=1796052168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2xGVo073SzvMjgFY5O4vhbT6qflI9yzKcYvMb8qD1c=;
        b=OFPDwZrR2SBFYmv6j0SYyAUIdQBH0SKHeS+5KgQtMTm7NVjbpPKj4PR6o2HToTlngu
         VCKLW4g0tVX+ng7nUYXIgJ0X6jWKZWL9i7wDnQrHYmsxihohyxxN2tObCbU2wcHKbo16
         5BmHwA85wFbPQq0IF9EZrQmUQ0xPdYJkEzUiNSNfS4dl8ysJf8LUqisqXhglHF1t61Vu
         DkM1gf9C+sHK4D2vtsipn70x8/0EPvgnNhSyt1yiILVjeAkuc4s64fJEgSP+/zu+Mf+p
         rBYyd8g6lBnHlBHZz99/Ejl1IJg1rXOgJSov5Z5wZmBJ/P90fNTRrOaCPubTUO3uNL8r
         fJ5w==
X-Gm-Message-State: APuU4Z9/Z1EUbKwmepM6Cv9oIZ7rszYln/R4pWJ6saHR/euTUVRWdNBg
	IHutuNitZAdAhprs/CCtWolnVQxTlfH3ysnFN6VlVQDMKi9/gz1s8VhqjFrSG4uuKEVDYcw0Rxp
	NywcYl1NB0Gnwg18/b6YudCXlSjK7HxX9Rw9QJKCf7u4ghpNx7ico8w3GIJLMMH1tHw/L
X-Gm-Gg: AZFdTZfJSYT0wveIDRnVP5DlSsOiEZSrHx+pWpL2ToOsN1gLMNgtuV5YN4+NTaNw24h
	46iR5e6lzKePZUJNRT+PAj33l7lsR/8KPoXIYOgqGPbsqxK+jBpICiYARZ7jmELBUlmNdnaGjYU
	4WAhSlIvP3at/S0diu9nHi+VBdPpLt1j/df6MF2im2K4TvVUj76FxWcfiXTAsytq3DYy5eDMdlA
	tTDfKHAmC/QhiLun2WevfAfHaf3gDoVZ49OWYSWq6uDQH9N6j+Lf0cLOZQ0Ub5YgOPAVcO4X0ES
	DyOHiG9c3ImU2nlfQ+IDskzZh7Do+e3KkdToYCIBhraHKip27IN/Qn1/liR2a8MyTar/4iiDoBA
	vZspyH20MDsEiyQaUq1qSlJZrE0U7GTBSuWI2q4UDLiNvTaJCiz3yhcaWGUer/jDb+IsBS1Q=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr1635382985a.3.1795447368329;
        Mon, 23 Nov 2026 07:22:48 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr1635378085a.3.1795447367740;
        Mon, 23 Nov 2026 07:22:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022b2bsm422901166b.83.2026.11.23.07.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:47 -0800 (PST)
Message-ID: <adceaabb-d8b9-46cf-8e7c-62fb116cc96b@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:46 +0100
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
Subject: Re: [PATCH v2 4/4] pinctrl: qcom: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-pinctrl-v2-4-958e205b1f60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-4-958e205b1f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045a49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kuyjF62R-fLzJYMBhd0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX2eIzvAFrhDNe
 xbQH41pChJWyZyAynEZvmzpoFja+8tzODPgDG1ggq4aTGveXueoHsggapWHD4eltmYzbgWxDUgg
 2lJPFGMhaMUJLGYz2qhmNotm+oGVb9FCOjfSBeT0rspSfVFrckrVLnmlos0o0c3Ka/YF5fyle7p
 lsZN4gUh0lVjoEmt2W5UbFUP8xQCqahy5pdch0mFI7p+1brdSjnI7Ti08RROSKcgcY0+s1Mfhvg
 U/QmpAUl5whfcP+JbKq4leQDcUNycqXU9f4Pr+bn7DY7V2wcWcpaZyAwaz0o+RgFjOI2FCFMG9z
 0zqkpl710saThLPKIWwFdTLEENp9m4eu0XZnRrZjUfhbEKfxdIWf+4EUSg0CaUwHTquptB6CcU+
 GMifKDNwqLdCtw6sM9qYotXc6xKTS3p2WhrSxLULld33mGagBso2XQViPqpYkkxcZyJ0XabLYeL
 R2qommS1RUYwG4LXIAg==
X-Proofpoint-GUID: HKCXSrbKOocCtvTnvd5rxAiYXNwN7f0J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX9xBglytAXLu8
 BbJ3FRCyalfABD2u3bUthdphfRIWikWtzMxOzMtJj5vrrMpQpNLLCEihoicYZwK/2sijv1BVcSu
 dnCclrXzYSy2wFygANv0mmRd9PGhqc8=
X-Proofpoint-ORIG-GUID: HKCXSrbKOocCtvTnvd5rxAiYXNwN7f0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/23/26 8:44 AM, Krzysztof Kozlowski wrote:
> Correct Kconfig indentation style to expected tab, instead of spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

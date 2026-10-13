Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9704477998
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918879; cv=none; b=KV3t2YV6DLyf0CgcFq0QtMhQ9KXzKKAp7n6jfpqtYyh/Y4OqNkveK2IP53wmyn1VwCdQMEOEGgYOVw2OxMpiXYvtcnustqJwoOvDBwYtC8BhXLZMZ9BG713kYMrDf9C5FPfy0SbUzFH8ymrAfubTh1AiajvwyKWKCdPgYElsIjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918879; c=relaxed/simple;
	bh=pmykTMtBSPU/oVAafGk24KBE3FFlLnr5N+CeMJEF6LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhvtkEKCzJhHIilu5yZJ2r64HPsAGuVGsTsnVTgGO7Hf85qFr2sdmIwYIFyviFK0VGzbXIuTsqMgNEBzpiiMNUIKWl+Fn+xtoZIfmfWpE6/6XKTMniLvDtafcM5KgCwz3E2vABFMLCORxDkmsZwouNPeUfAv7ko4WqCxIjGmFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKgVetjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gc7/iRz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKgVetjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gc7/iRz4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DEq1xE1403104
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=; b=lKgVetjplREUnJh4
	7iALWVWIP6om03f8b6FUaHo73isbCxsNAkBSJwvW4sZDHEI3ZVZKTkLXjJvUa5Ed
	MaALsm+uw0nPET3dpFhUGLFsbh6Q3ebjqXZlZN4/lHqUm1GNzlgCbzWHIOZmkyfk
	e+5yn4AwqO4shxcu0IO9DApGlEkiS5ZI0j6BmjOjyE5avrlvVgyUS9AxcZcC4QFv
	x4S/0WHNsxosz8qVZJ249qtjTUu1Ij2GPmivaPEFlGaD4PNDS498pVt8bkNmG2GF
	BD9K7ukVy/Fi5Asc6Fpt0FsZW83kvqpkc1NZwH5ExbaEDDa7xS4l22AleqfiR+ox
	6szy9g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9psk181q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:14:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a04491c56so230679eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791918875; x=1792523675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=;
        b=Gc7/iRz4LBd/Jqci73ej4xsBkp2fBok7WQv0LZHm8j1R93Cbzjdbg1U7+qKvkqp8F8
         iJ+VfQuhPzRuKwlqheAiBt54JRDB6bzTQtioUVdwOtX+WUPzcpplFtYZzJ93llnhuDWr
         U5L7ubTzHBUFWIM9UY74trs+l+ej8p0s7W502L2bXoMHCxn7tv+XwpDvjn/C4FJ4RJo6
         /gQ9cfnq6z98335B2I2w+AugLfg1g00W1UNnSkjg94bW9dDzZoqaX8UptBnnV/B4vfx3
         JRqSFGgVw+OfJYqflDBdQDFrnGC1xAYeuA/tpLjK4t+MboON7ZDFxFlzfShGlUWv6Xov
         72bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918875; x=1792523675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=;
        b=oF3zRPxMiORqwjU9+js1Rtl+PSrtiO7WeIr2jZxHqdqZkabxlk2SqPztTyVlOeG6KW
         sF5saIR36dDJ7ra/OkrbCdn1C0f4mPmNfj/hqpHy7qUYvt7Q1gARKgFdJW27wb2Pvtcr
         nhYcHrpoyk5pxNjIyOeiI+YnPMBVTStZQTDsje/Z2gioJo6JzfDHFUXOgF9APVT1qPxa
         v8h4hnbrt8Hs7jWpPkBV0XyJpOSGFcebRtdlyWtR3Pa2uGQIB7uhmTqN188IfDRWW5vo
         u6TTjdF1sOOdYj3FxYRimkM09y5RkAm0/YBPe8WB6p3863gdDjYYJmuxAyueg8z4+LOA
         sIIA==
X-Forwarded-Encrypted: i=1; AKwUvByMaqws2kJGzl4bsRccvmpW1lbdvzvPQQRaWDb4Hm7wET6xF2tm9QkQetZKPIW1D5xULf1Ey/6ZIZQ7+HD0@vger.kernel.org
X-Gm-Message-State: AFq9FYIyzR02btPhq/CYes2RDaxEPo1PgQtvPV3zXADgW5DGgfY7VVd8
	9FB3z8dGkZ8iGGorNEcZYb66Qazt3NygE3NO895jUcgJpYbIPqMsFgv/LQ/5Q4ANDbvWiUK3HPF
	4xNUgyX9/lMd3X9bBOwXtOgMc2/lXqk/9FMggBE4eLlCGumt9EqsN7LLcaq9WcXVI3p7V
X-Gm-Gg: AYBFou1RXL+jmx8y810GeioC2Ox9KAv8noXlZx0iDac6qwiFQaXShbAEmu+JDfIAG0A
	LBjz1RKF8pk8JibqP6b72i8TekDwPTJ2YYsXGqRAg6/vdflKXxHmX0jE39xrTEr9jiJeUt7BcIZ
	1UaEqvld7cawdyD2Wv8O1Svew5C1RDv/LyEr9VBEW0+gzXA8u+qQTVRmWNb7RNELsP8BiaBQ6o1
	QgwiAwlofRszov/Q6lfLSs+V/lR8QyoCw30JNyWQsd/Zr4MSeyTEqXRQdgVRCgVXsQ402U2KKRE
	vy4s/OeOmtKYpFx8Za18/schnRSDVpPImFmmb4b3wcx8ENe0MTG90sr4BNnNqT5iRXJ/rEKXIk4
	fZNM6urqSxBfOU9XRHat/8bFCkcoCQs2lkGSnLVnDehKKxEZuQuw6t+0q38LCZMQ=
X-Received: by 2002:a05:7300:a8e:b0:35b:f6e:417c with SMTP id 5a478bee46e88-35b0f6e434amr7495276eec.15.1791918875202;
        Tue, 13 Oct 2026 12:14:35 -0700 (PDT)
X-Received: by 2002:a05:7300:a8e:b0:35b:f6e:417c with SMTP id 5a478bee46e88-35b0f6e434amr7495197eec.15.1791918873849;
        Tue, 13 Oct 2026 12:14:33 -0700 (PDT)
Received: from [10.71.40.138] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm16076819eec.1.2026.10.13.12.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:14:33 -0700 (PDT)
Message-ID: <a05632fe-7511-45d2-afa1-a2215db570c0@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:14:32 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: enable L2 split header
 support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
References: <20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com>
 <bea80b7e-3d44-4662-b3b2-e97a7f903aa9@bootlin.com>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <bea80b7e-3d44-4662-b3b2-e97a7f903aa9@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vwk_Va9r0M8gRLJoJvTSSYBKSA1BrlqO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NiBTYWx0ZWRfX/KSlsq5Ex6bN
 z4bnRaqQOBK4+Pt/6bWq9g+fvmC2Z/r9ZJiFuPXjTFCdOt+kxbUGuRyf140Pdgy9S2NLepeIWiw
 7evLOVaumXY3cNPlTdqmjxOhasQFQ/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NiBTYWx0ZWRfX87tL0v6qN7Qy
 xuT7NgJ+RWOWRGrX66DzDVq0ddHbcg86RyW0EY+4Sp0qEyWNp0ws2+EBF2YIOiH04gXlJV2ZZQR
 PG0tHtsjlfRGOZyBglQeHxB4TZtQUHu5pJZZQNmGY27PpnuwaG4PKMaGeOFHbVOz76aCnJsBEKf
 D5IXZ04FbJpNzjiDOqxnJRWHtZ1UT55jECBKxrZScIJ7vR9TouOqgrRIDsEwfcV4KPwiz08dXV7
 OuA2TfltdVU40ny6LW3XxsB6sx7Fc4EXAD7phm1d8JagVH132t/YHVYMyFAfAL8+9JvU4hian/V
 uisepP1/eRRfUW5cn3IqD8ULkhljjc1wynCLQWWmU2hdFleChLDvOgan8uKL5b5wK+Q0JnK9wWF
 SyIDDIHd/+NdGZGrspVOesI6BdGs8E1KC3aluWISkEodzdyF3vVA3U5adyMewABgORYj9Bb6sp2
 QR/qwOqY981Ft80aJiw==
X-Authority-Analysis: v=2.4 cv=cbJHPXDM c=1 sm=1 tr=0 ts=6ace831c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=4tsTETeE3Fl7JHlmqNcA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: vwk_Va9r0M8gRLJoJvTSSYBKSA1BrlqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130076

Hi Maxime,

Thanks for the review.

>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> index f8ab347f7b5b..fb29dd489714 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> @@ -167,6 +167,12 @@
>>  #define XGMAC_HW_FEATURE4		0x0000012c
>>  #define XGMAC_HWFEAT_EASP		BIT(4)
>>  #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
>> +#define XGMAC_EXT_CFG0			0x140
> Let's keep it coherent and use 0x00000140

Ack, will fix in v3.

Thanks,
Sagar


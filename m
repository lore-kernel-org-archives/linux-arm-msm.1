Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977613;
	b=UpV9iNoiiyjONBPQAyacmjMTAM/yB05XG7q+qTBlo7mqkGlxvvmUoFY9q0sFtdPyKxQJ
	 E8K122gYd3RHyz+lHPjJSA7pUF8MBuux6YVjlgReEWZRem2+qvt0Xa6TP8FGgcnFR6ykd
	 dMxYfM0s2ZrnieoNKUJxpxFMcauj5YXGwkfJLflBHoG5Kz3DSc/giq5Ck62vr8ar/oMP6
	 4ZSAmTGvw+5Urf1l8wFJYmrU8oke8EmmIm7OWY3MSP5e7wSpRbdNbycYT1ybxCzOHo/Ev
	 lq4GjJzXl04btj6ypfXXfXbU16SjqUDYA2XmKgtlpyy+SUYXcKdcYTdDQOcFVz7dE9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
	b=L/EVDrKPw8JOfvhykHKh2Q+KKaKvUxWm2wYdjYJm/rvEX93djUfXkI6B2oJ50rXxAyt5
	 SkqVPpqF9ceGN/Cr6fiwHpCp7xJBRIomBiCyf0YMBm9hahM5xcynrApwEPzBwIOqG0LZ4
	 gACYrAUWWNL4aalPZbVweXaRo+Awx9X85rVeGlS2QttI+/uJYh+f0D0rUFF4rB5PH8fqm
	 lid9Wvopo3ClGJkRLmecv1jw9fuo3sv4sGhMtDKPkN69O6eRL6v1INjh1G3I0S/YwXBKI
	 Ijs1GX7lW6sRwaioue1de9t+gsSbUYNIK2EYsljqA2QHhi8CLsZiFuLA4aWHeeLL5WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gWXEm7MN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlBALZWj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD5606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAAD5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gWXEm7MN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlBALZWj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExxNP3722899
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 15:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=; b=gWXEm7MNK71AuT+y
	vQxWIM7285UIISnV9IKcJDh/Gl/Ms+NkVZALgXzr0H371+obyPYjJxoaPerlqRfn
	xHTS2kyPoCAz0CIkCXDxvKuqcIUAU6nQdCZ4CUaLq9hHZ0JAUytYNtGKg+ldgKjP
	Lqxvf3nKcHBBVbYNTyqxX64DkSuLgTh/DSzL7njpTbyTZurSxLfe7D+I9H/zVYLR
	BCm3zfY43D0BjvR/EmeVY/BLAAJSqqw7xesgFio00fmcTZoTInts8/bdjy7sgTHr
	Ju9HCLJwcKr7dfT5wlonPKXku2dnQrwz2DgIIQorWGHVpA//hIbVcpp3WHc0pjnn
	7HvZVw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k8bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:06:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecbb3b4696so34474e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977611; x=1794582411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
        b=OlBALZWj428LGdJDpPZnpWeJmtML+PKWKTc5yaurfVeq+h3/44ARCFNsCbf1mgs6Da
         JHwbv7wYep8vv99xQ1mORp/h9kgTlIYRFV23+tsC2XJX883UQIQGQ6kI7plUczpghoZE
         qKXteQojUNiIcrctJ1UQaUFpQlGEzNhnUqM5L7NGbvx/FJtAR9VIO0KoxciAnAgD4BSX
         fs0VHrL3HfANd42GTuzzQFyNkaIMXMdmycQtccXioFT1lYF9y0vqyLO4/CgOugTVuiaj
         Moeb4+hm1m93k8Yg6jqpQXdCjdKglv9VK+KhgXigKKHyNuCjRcvQIBRBcMsEhHzfzAaU
         H/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977611; x=1794582411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
        b=zYUjxz18XuhqK0VE3Adk4Qy2ENnuP9fkqtiy1Gk2H2DunGmZlhBypaMWe0DJ/QZLMr
         DptWLCUCOhRP5XRZZ2KQ4QSrYNf+h4sOZwyEHC6ZD4pT8A9u7U/ZOTkiV73/BSpIpOJD
         VJo77kthQlqLcWJfNm0G1ED3DaNFdbDg/H/2HwRI5KqGjhCrP0R84hD7FOr3fhDtJEl2
         Z7joJB4wBu7Dz6O2BYv7MYDfY7IRakm5Dh6X40BVVdQBxc7nf+2AVtq1BzreyrcDOkjF
         RFv6G0eGX9ZAhLJ2HoUk9fHVSmMXnFLVj7lok/eNe6HucVN6zDpMdjIwwa2mLlR8u5ep
         bTgQ==
X-Gm-Message-State: APuU4Z+V7QQw4QIiJid89UdhM+Da8JEVaVNr0I2T+p88c1ai+EZG5tBu
	sqCFcYp5CgOWuZ4cTeOms7WRTRfAsDuujKWCI3SvwU6dB9H+fy4NGSwpF0DoKexxucCZCfDhl72
	nsju1tacBneWnZRdwariBHEYH8FB53UEJwz8FmTgGBP8vq6f81AaGTdSEBn/mh79yYxpQ
X-Gm-Gg: AYBFou1z7w2GVoqaiFKhW53aZy/vQKrP2jFoY3eCCEsr7pLiWfDdhCUMMCE5MVm+Qcv
	8a+OHXjkfJhqT2FpKaGnZhnlDm15bJ/DaBET9kDgNRMEEFKu8Y/jTTAVaGMTIplUnXS6IHPdFL8
	euseb8Na4PeNrYtqwMDXpSeMLk7QOs18I2c6u5wk0e+9HhBeFC8RNehSfxStMv6EZbZrKre/W7c
	SB35hEXILRzVWsxsqeGGTKB4I+jWti/8eypG8+8PhjbsrrlUi2m+qNRs/RkOPzVFzVe6g0tVch9
	KzYe3C9Zax2gPrjkiQXPR/QPtCGhuHVijuixrAOEaI8WEemLhnKk40tnKwnsfciSzGp48Tjg5KP
	5oSBLbtf8Nsp706hJW/4+McN6qHVc1CX30iswoLS1I4BOQKabGuRq6ttip8bg5bsLAxXOPg==
X-Received: by 2002:a05:6102:3c9a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d2a12f2e4emr1247557137.1.1793977610869;
        Fri, 06 Nov 2026 07:06:50 -0800 (PST)
X-Received: by 2002:a05:6102:3c9a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d2a12f2e4emr1247498137.1.1793977610311;
        Fri, 06 Nov 2026 07:06:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad17aasm785720a12.9.2026.11.06.07.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:06:49 -0800 (PST)
Message-ID: <62e5c1f7-72fc-462a-80e3-bc26b92b1636@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 16:06:47 +0100
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
Subject: Re: [PATCH 1/4] phy: qcom-qusb2: Do not request reset by index
To: Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
 <20261106-reset-deindex-phy-v1-1-6a9c9f428be8@pengutronix.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-reset-deindex-phy-v1-1-6a9c9f428be8@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 44q8_ix38FBNghgnv0yvCTE--rPG7TJU
X-Proofpoint-GUID: 44q8_ix38FBNghgnv0yvCTE--rPG7TJU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfXxQGoD/KPkrLL
 f3GpOftJd/zjFztQAuZ15qqxBbUGQI+9YiKu+uzXY9CGTSLRV9W1zTpuD/ZSzkkXy2/XGAqtnP+
 kr0ICBlXqH2dnKWs/injRzNW3gm33DM=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aeded0c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IWuRp9V-5v9cUcI_31kA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX+z4EizRKNeyb
 9UxwUUL8GdAF4t/0FwC2Cgz4fwOWP6zBK/raxtPFSThAZDSiHF/aCVq43H/RC0dOojpQXuGEYe1
 SqKNLWFZ6thkONYuA/u4MoS4CmLeHbIUN5ceYGZ59yZkWb9PmZbq1PnwbFJs+HQg5DBOvq9OmJH
 VxRlQIyk96RLp2iasWgSz00UNTuGTxDeay335/DWN+qMKEd5ruAQDCdAYiDa2x6s23kOa6SCUZg
 zpHjNLFI+ORvTOJ73w+Zt9jBxV0oy9UTAZTbclrpPssLnj15uO1EsjCh/ZiTRSKCO2USXHqhBDr
 1Ux9LBYcTpBkxjMQp5+P/aLZsUlcpQMY+X16GWR1pT6y/pba8xZsmLuL5XFeu8ByZaEhH17jTRt
 EAuDcuCfxFfs6NCag2EI0yzYZKifh5Q4suF3yM9y/t6XgRqSNyV0WcDsrwARzyJfMW4YVPC03R9
 EJIk5sEm453KgTwKHwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

On 11/6/26 4:01 PM, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use devm_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

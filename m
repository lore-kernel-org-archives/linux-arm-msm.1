Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C77486656
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329871; cv=none; b=VEA/AA2oepqpSOdRETOtv5dHTo1K3lWudSDj8AuS9o8GMlrP1v9uxDP6ubxXETVv0/f3v6W2t4EM6eRo6f7lgy0NlYh0H+JIRAeqetidaL+BuhcVUN87AEc9bzez8Nzlufm5NR4nz3xQ9YSwVAlfEOo3EK/rBHZmXrNEXBybtZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329871; c=relaxed/simple;
	bh=4mUYqTwH4Y3dl0t7kzrCZYl8nAq1yVFj7xqSOfbQXQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdKtLvhCstwGmVVfiLBwEZ+1kfbjLYIvOeuIkYEZO1GVBokIsRBppsnHNLVF7ikN+4+dMzAe0Ket89ePHtaB/h4ByFmZDwndu9WaW6kCbpywLFHgFoPXJ/Wdn1pOwO6zMEoOZCQ72tJzUdoRMZ+lo9VxIrlhNQW4Kq6oD7l4xy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qh5VmIR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWrs0T1e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qh5VmIR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWrs0T1e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YvLm3532505
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p1BHZ09rmu017kaXVd0AyNSx
	ij3jcnxOgDz0A5/XgXU=; b=Qh5VmIR3HlSDHaGoYET2i9YIr1SqSnYDDMyILtT2
	lmcCbr1IqAhgUd2RpjDO5a6yZzL9t24/XXBRCy5MIsk/FuA/5xp3FndNSzAoyb3M
	aXeLEX55dHAFv2NiUqBgQFXLZYBuRVhXdXdF/kLrt38ab76kUExfL0DpcoWwSAUx
	oMompl81AOVJDuVA5ayNvRqyi7vGPX8xtMYuoIs1V12F9BvWyUnPJdso4lS9bj35
	F8UwCZpZ5yTWITL2oRMA93kDKtqCamolrPH1lYj4rEfemPxi6ho8rYebC70ZiTT2
	u/wJPf3WKt+DsqQaEza2nH3EZr9MojgtTAWU8YcnAaoV+g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kanbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:51:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so12172346d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329865; x=1790934665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1BHZ09rmu017kaXVd0AyNSxij3jcnxOgDz0A5/XgXU=;
        b=NWrs0T1e6+XUKN2R5T1Bvog38RZXafF4sHDZaPg1uK9f88byuEFsRIDOuKr90aB6Mz
         isIEFDLN053ETOE2cZdNgRkB49AiEBZP7kifD9VNRlrxZFhX5xDXK6JoH6UtHjpLdql2
         bdC0gPczTK+a5/g2gWyqYqLMPac+uDdusTzRrhIFM4B6VIEhva/GydttFFX7sDO/49pS
         m6Bhwlvzuz38fNYuuVlCqB2maDbKuWlY/vOga4PiA+n9PvCM/c2TA+hpXF+MZl5y8lV6
         fEopmVGVjNcA7Jg3sRwzhO9XUdDZE25Brzu7gFGYrxLEfyTt8ofGJNhLiMmPn63y2fPI
         SWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329865; x=1790934665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1BHZ09rmu017kaXVd0AyNSxij3jcnxOgDz0A5/XgXU=;
        b=Q61h45Ntmw+pv44zgHh6cIz6USoPUvES9a2Gux+25tdY7KDCld4v6ZclhGEz6KYeAM
         tGdf4iMo34q5jCqruVy2vrbse7mnKBDfqLwJp+Td06lv2reFOvIyZRk652qVAHUnl8ER
         h8MTX0of6s/c8zHAojHkcBdfbGSdBmbFMo7eU1AKTjV+RaIJYRtpimt/7DRlq9la9yte
         t9Nzz+iSg+4n465tGIpne0X5nQIpBsd1Yba26vrb0Jf56lxi4bExo9wC8+7KP6zSMbUA
         jPlM1rkBkWgnuaM4wA3qjEyW3wG5LaOqPxorRwiv0Gc3Y7l6eJxXwmq6hp0tByFUdRMz
         qwUA==
X-Forwarded-Encrypted: i=1; AKwUvBzQhr4rvb7F51cGtyDD4tmO2V9q+NPbG9PijdEalUzJQCEK0ChfzV7yLRY0IRKT47QGXNpXdbMYk3Zz5NIE@vger.kernel.org
X-Gm-Message-State: AFuF++k39KS/8SNenPvPHlAe8w4DV+dRbqbP/JxgcSVcsL00UFRAKa+W
	TKZWNWFPsIZpjwII8fRC+OUqSqfh1M7fjCMq6mOwIML3lsvPqbWLEgWTuVDc8nBQFLZQnyC8m/i
	NyhjbRx09BkmYy8f6455QxV5hy46OLKLU/GfkU2oQdZlvR5LGgo3w9LeHG6Kz3QE5WBiX
X-Gm-Gg: AYBFou3BrnvVGHF1p+PzZzmNbK8nFUgIz3xi/nOlyqPQyK8iZNPrVQ1RW7hF5gtBKjY
	2IaBfGgZTyVUS+N5yT1xqsT6fjgu5DlhiSnJxeuZw5k5VXuiVx8N2Oo6gr6Czqz1MyEKn+dPcOG
	4ilRICIKLwUTsa3gP3FIC89XSrJtYf/I8vVtjlkpyIOnhBcwZxeV7FxXdE6Er54ClhRslGsnxEJ
	Ejs/ChK93d07dI51ZJCnoHYt33FqFzgXlT9HZ+WDl/QLwo8LjkA2TJcDTNfsXjKGgvK+kO6cT2k
	pJ+l43shbUP18nm5l6PqjP73d71ZhDDrpsocN/ReuvYucxcrJ6USeHy3Vv61ORJIviRHC03nMV5
	BNoZTBPaY1dWkeyA=
X-Received: by 2002:a05:620a:701c:b0:93b:fbf2:cd50 with SMTP id af79cd13be357-93c43c97209mr372237185a.41.1790329865395;
        Fri, 25 Sep 2026 02:51:05 -0700 (PDT)
X-Received: by 2002:a05:620a:701c:b0:93b:fbf2:cd50 with SMTP id af79cd13be357-93c43c97209mr372234585a.41.1790329864898;
        Fri, 25 Sep 2026 02:51:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm29314895e9.10.2026.09.25.02.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:51:03 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:51:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add chassis-type
 property
Message-ID: <qgnyytnukavlphwtexrsldaaedldjoqnmylckeny4ksqdnocuc@4nwrlqhouj6l>
References: <20260924-topic-sm8650-deckard-chassis-type-v1-1-a58729799bb4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-topic-sm8650-deckard-chassis-type-v1-1-a58729799bb4@linaro.org>
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab6440a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=96plJQVwC7y4dvEGRvsA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eDW7BzePVsaDio-0fxmBGvHTUhNIlpiy
X-Proofpoint-ORIG-GUID: eDW7BzePVsaDio-0fxmBGvHTUhNIlpiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX/FU0WYcbzhHh
 N/0HXYerAzo6Qd9JtrHG8PscJkIKPaX9y4Vkpp8MMnP54XM8/FxPWQcTVz+t3OpGmGalT+911/d
 m4WoYqA0cjKXCCe4MpF30ysbiV+yxpG3tm+hLd9lnnbTDUiEPjIEpVXV8/MZZFQQ0VmjUV6A2U5
 Lve3vygQKUcHpv71GV0zhapTDCXIZ2nhkpPOrgJjfdfZH9aSELLNP7sx8wXs4Jr5Rgbh5FSBJje
 uW2hd4syOxIhRg7H9Aq0YsTrUmI+VOjp28Xastv4L3HNAKnWdMojRC6lAYbg+kxQSoJDLt8nqZ0
 4pDmSNBX4nFsJbs7n+c032AFVXdxZGce93iAOPOJhRgoMJs9fK0/wRH+6Jp/2eZYfkbggV9O2Bj
 qyaJV/OsxUUdkw4DPAz7ZZrMqCViRT1yH+3Gdvowqt269/dhg+zvYmy5Y46YOfkr8wdKufh3GvS
 VUAb0uqgRTmYCqchabQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX47/2XsHKZbL/
 fEmxinwSNEe15cc/ZsHhK2Hxx5YZErHEMs0b94U0JpJzi6O+vlcXSrX5OrerxM1jTJz6FG76ses
 urbAWgoqzwUn0vG5U0quEqecYGXL8pc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

On 26-09-24 17:54:59, Neil Armstrong wrote:
> Set the chassis-type property to "headset" following acceptance in
> the Device Tree specification [1] and dt-schema meta-schema [2].
> 
> [1] https://github.com/devicetree-org/devicetree-specification/pull/87
> [2] https://github.com/devicetree-org/dt-schema/pull/211
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

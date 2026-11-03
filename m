Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699492;
	b=vvwik12aueQ6lTHwOa2ObmKrhWKdLM9NYko5WfSsSlj46EVWRoFs4YaG3lGr5chX1AjB
	 WalNludQEqNOvZXJY3NMMWNep8dpPuwrUu4VpA1aSzkqcuyeyVj6PuodXgDvzsh/Saf88
	 Yxduwep4g+lQ41blh8JXDDvndbc8fhrpngdRVwyXCDvn32D5Jd6wLsWwDLi0036TIup4t
	 DmCWgGD6v0qwCF4MVr1aifNMAGjpoiywhQ9OOzBRRSXTdZzISZg2BUsQweQWS/eEaTK7q
	 cMVV28U+2ZKUKJE1X//NXnYAW1j1SDxOvdPuxodwZp1FW6zOHfLuFQzfEY8SlGlPPmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
	b=P1VS3tIsUk2mX253xfTbK6WeESOXauEqzN0LrEmeRhbsPB12uC9UUCGRAvFy0NI5Q6eY
	 gv1u63NSBMI30WxFlk87LObYmUw7iwlhv0CIQ3N3hqHXGmfMYLoOAPm0HxyTaGaSwWZyV
	 wvko8YXTIaF6+DKMRCU+9PlbZpfr4H4cdYWE4R+qLBmbqL1JC3R3qCiaSs9vs82gMt8As
	 6ZuJiHcvWykMITncgSYEjwR6pf1d3fGzFkAg042szu1VJ2aMiUSfEaA3gMfauuus542Sq
	 UWH/MQld25YqLbgR7N9lVR/KNZHzmV6Yia4L2LFgrBmZmMiH+1zuEcOAfEohqmi7Ttg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLY6HHxE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PApfJzOt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C0606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D29C0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLY6HHxE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PApfJzOt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A387nEI4002679
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ndhs2gPZWQqMxGEvtstXED2i
	vhl7ySi/UCRjgZTdU7I=; b=GLY6HHxEgQBey5ncZnXyjc9HW32D04TovwDXn5gt
	m4tllotCuGqZnLA07vqzTV08uBxlaJe7GpGxQMmnvDiXjvL18OKxErsSjS7dijw1
	yutbpVNjGLfn+TjcFLlUqeyUjFsZoCPTwi+ac6X8VKGRzmiolkIjL8QDRihA3P0y
	X1joBtsE30L4pTvyxzCHr54wYWLF8rPQtY0Lg5uWsaARO7Tl64/zZrBXjSDfRiHj
	Z8/EqW4HgMiT5CzkTkvVSW23TqlOlWXIuyOwUp5QQU9gELWRx6S4sijd4bQycp/I
	sX21A38IVAt7+f9vQQtlMTrl4qtMPcixR937hRfrzziXHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ek3rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:51:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943e8ff02d0so351796285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699490; x=1794304290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
        b=PApfJzOtRCVsmfIPjSOsNGMWSi+3yAu2i13NyBDgEtBoBWzZ8c7ceTAmJNXC9cgk3k
         +nopD5lwiudWr0EV6+vUd7seCFk1GJMl9P/zAR8Bs+MsaEU1T2BvOhr75fH2Q89abSnv
         0Qru2VlUwLVRO3bLjmYXQv8Pz2nBlD9fW64HURelOvvvkAoFJfQTg8Ft4wyPOmaSrjry
         GZeSwc5iFcwN4i0bzZLVIaAZHldff4sw2cmWzmw1dX2KP4ktbhOQRHLO9EW5nMOCaj2r
         AJniB7RMRmo194urdwPg6XUqBaaHVWRbBk4YlySkHljwebIEBtA3J/18H69KqCWRexsi
         sz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699490; x=1794304290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
        b=EY8MMXs8Uj7QSZZF/kdJ7POTMWaTuD7ORxyLPNLwxxKWc3cKgifSqj3mGe6k5xEeVM
         QSu1D6sCFhP4fZWZKZ1BqLQbT6vj1YI2+8F37qdcx7OmBojNO+cTlPmhSw6AbiLYfM3i
         gdCsa/BtbHtJz27i1IEKyjI3IzKUBh+zEu/FO7nQKVuYCnsBCxKXfJLjWz7K0jJUDubg
         Xjz8NDvn7fuoxvgBj8yi8Tt2jO1lIucKtsN7lq/z8TLUXpBHjd4rrnQqBHcF2Yuq+ZIz
         COFHViwh7TwkrlktWPaOW1O3lAi649FUvA/UX8CTonxR+skdJhowbWyg+JiTcDtVzeIp
         yqWg==
X-Forwarded-Encrypted: i=1; AKwUvBwXxzlrVf44qRyoXPX6ubm4JK0x4+90nT6/sdzL+2xiaAzojvEM7ErDGnCGvrVFTMtT94g27p1o5k/yI0tc@vger.kernel.org
X-Gm-Message-State: APuU4Z8YuOdnksofa9EmAAl2iAzasSJq9DYxh7fwOTwB7TWvQwVtHC//
	NBRtQUppZI6J0/gb9M3shvF8OBWyWkVpHxvOcBMjgCubuPgF8+kegVeGXy6p6fYlY6rn7W1SpJe
	fHrV5f3ClFlh5yYajAGlKy69qXLS8fZn9BS/EnKqChU3V5N/4DonKzqzpx95SRpK5vjjx
X-Gm-Gg: AYBFou0ciE/nS1MNSV2oftRHzPvUSCXdxNccdPSEDdwFE1ivTt0NwlQBJFskJ3mvlIr
	eMhKTpmvsxk1ek68jCWxZqUtU2zbZP/vI4kkKZv0Vdsj5ppdx0A+HFdYiCKCqPjzzDt0PEftNRV
	cE+nlDfrDkJ4plqjVcd5uy4c1uowJyoVuxDJmWDdcrIUgY8NmGNk4Fsm9B4dc4Z8qlLxb1WcCS2
	sffnZKuk9y1cvD8E8hlUm8KnNM1smFoQsgHwVFdIQyweITAyebJKGQ79ogjUbGY6V/0W4XiPnfe
	zTNEpl8/3C68JC4kBSpA1RxGRYhGCqIsT/D1leJGf4CYJW5GgecI1PKp8Efbr8JYSKCcnwZv6ni
	/Gn4zDt/C2PkbuzaK+QGIXZtqCu3D8sHCsDsp6XIkZ0U+tc8+5WV75sArB2LBGPQ=
X-Received: by 2002:a05:620a:271b:b0:93c:2c15:e513 with SMTP id af79cd13be357-9442178a95emr2014619185a.63.1793699489864;
        Tue, 03 Nov 2026 01:51:29 -0800 (PST)
X-Received: by 2002:a05:620a:271b:b0:93c:2c15:e513 with SMTP id af79cd13be357-9442178a95emr2014614685a.63.1793699489133;
        Tue, 03 Nov 2026 01:51:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b393fd1748sm2186495e9.7.2026.11.03.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:51:28 -0800 (PST)
Date: Tue, 3 Nov 2026 11:51:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller
 as a Type-C mode switch
Message-ID: <6d6aic4idenq2keiqa3jngibrurldo3krytmvjovudo3k5wlmw@zsoujav6f2jd>
References: <20261102215121.738-1-26rote@gmail.com>
 <20261102215121.738-4-26rote@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102215121.738-4-26rote@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX4Cnm5pMtbNWH
 WLhiAQUuI++eMgtVfIbLQ6BZcdlag2ZuElfcJ5z6DIg77Rw89XOcnELVj7j5UwdCHp6ZO9ue369
 XjM5Lhbep/chvTRfbEdkpWdl3+sN9GTnpaiUL6NTuN6oEwap3MqL5yS9Dxs4OoEn3jt6JAOz8gR
 EgiSf3OVBpxKIUuUvIALEtlgosa/+nSmpjutH+oHHNWOXdw/a7VyBoVRFSj+9cH8u53z5K05Am6
 Cd85J4GM9cj/RIZGTrlLO9fgRQvy2/iC6/Ot4sdSeDq5IwxIn3EHQQzxtcVVqHR7bHykbonYtH5
 B9x8gJPcGFAv1VynhtFcEyz6g7k0ArQL8XbkZ4RXXGJpXoIF4y/ztjg1wg5iCRv1xNL4+EzyrqB
 Ha+bqFxvHdeUedZP0oz0JM6V5fPN2YmNp1q0RboRi14wHw6sQeY0H6pFdwj5pOFqv6NhtDzeqJJ
 /R3/rW9lM9oKf78cRlg==
X-Proofpoint-ORIG-GUID: xEZo6lOFG2OWbF7CL7gPOXxLp6dveQvM
X-Proofpoint-GUID: xEZo6lOFG2OWbF7CL7gPOXxLp6dveQvM
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9aea3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jTYuYfucqK6tsm4y4RIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXxYLIFxv0Vjul
 dHWk5hI/Xg3TozDXXaF5gwO6dpwdClQnpI9Rq8fSBjL4y6w+8UV5gW/P04ppdJFPbq053Ltyu/R
 r2zqR5inOXJmUnygi8YnJW3VGANmInM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-03 06:51:20, Joonhoe Kim wrote:
> When the USB3-DP combo PHY is a mode switch, DisplayPort pin
> assignments C and E put it in DP-only mode, where it stops the USB3
> PIPE clock. Make the USB controller a mode switch as well, so that it
> moves to the UTMI clock first and keeps its USB 2.0 port working.
> 
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507362;
	b=ZXPHeDJV08SpHZMLb6jzqzfMFFn/0BwfHId5uloCR69gxMgi5Tkr6C5/4MKLb5hbMkZP
	 rafE1+2nnfFar7IEdqCrgFPb/aLVc34TbafJ5IGDkOj0RDUULpMFXUaLNVRhAe+5KZI6H
	 ONWWxbNMhG9WFZ6SJu98LS/xQ9w4FJ3xnuEOuIYHyS95tj/+dtLDuUwIirlzoZl1uP757
	 ppneE3jb/Gw9JdrKJR7UCS0TvmhK2uYTa8vJuTtRAToocbP5U9QZeAwYxnKkhHR5uXagp
	 lTfQWJwj5JOKlFSM9C2ku1BGugTSc31+9z3xMEk6IRJJRcCIMHoTMQGMCj8hAFawalA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZnQPJgkZZu8xkO02BNLsnjQPwQjZq8Elk44wJNhSTVY=;
	b=uJj6Rq0wfCR1eHZ76QeWatRDNZEi6ZhR/Rwtg+dVoGuCOCe7BrFoJE2mhCvfSXtkEUM0
	 BnIoOXNO9LJvoF6DzsbXdav/6Ybox1QGtAo5InVpTdiefE3cKHqM122Ctz0dUF1yFNG5p
	 ErpuNBzD4WU/x2cDotpWvenDcA4ZaQefk7nfUrS3efat9RW9AzHH4ydEdQUykyImUUq5B
	 u0KLwkxsdDWwZzT1T/0kn4gP4RkuoL5DQ6Z0aLdTGi6qUvp7hO/NFdPFB+elkpVNVsjre
	 +X1fEYxeVdfwllEyVB/fF8WvS8uFzNMrzEWaS98wtWiBs+cfg0QAmIhSotmwKzd7zOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=baR18xEo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8eqkpUM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE6D606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE6D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=baR18xEo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8eqkpUM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kWG3647168
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZnQPJgkZZu8xkO02BNLsnjQP
	wQjZq8Elk44wJNhSTVY=; b=baR18xEo02GhDXQIJZmctaBVYOdtV6iV8Gs0QlND
	aQ/HtgxqYPg7YUxXBVtM1vX1SY742t/5LDqg71XbMgelY0Ru3K3ngTaoswFrHTSP
	fIOseEAfiejKaa6niUJL5zIWpnCztAMu+n9nEavB6htxb4X+qGM3rtGZ6z5sOdl1
	TMSr+jMnjsQKhViQnHROVfbNkF29dmNbxGDPdpF/wpboAM+yizyjwyY7Fz5SODIy
	q1/6VuF+L1MrL3PScm/TCiKTRglVVID+7BlD5cE7ABHZSxQtwZrbnDfvWsLuAcn1
	NgcITYU/DZAIfzQtBNKm5Tf/QJ84zXfNYLhbr+Pubou+Cg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd1hqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:02:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4793039eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795507360; x=1796112160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZnQPJgkZZu8xkO02BNLsnjQPwQjZq8Elk44wJNhSTVY=;
        b=g8eqkpUMY2taOzkT36IrLJAjUUWry0covxwWS9SJcaMrKK4T/cTHOBngzSg2/pp0Jg
         9bqcVvEiiD4Vjr+jtdpHG2hCjYMzibfwNQSLqXAz6vzNYb98O//m5+GyPRhjHFHZjdI9
         oZlgMMWODTIX5oqTbAXeCOptSaB4j+BZF59RAw0AgUbS3P7TmRhi9bxK4UudjW5x67qp
         7Ime1ge9MFvFnlEzRYX4l961rAC9oBxuTDlBuPZOBr1qzSAVsfR3G5cRzfmy/joan16H
         lqNgupNxgaumCA/FFqPoSl2qqwGxb2ob3lgYypGHtyj0V7f+6qsozd2+Zffn2HUemNCl
         6pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507360; x=1796112160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnQPJgkZZu8xkO02BNLsnjQPwQjZq8Elk44wJNhSTVY=;
        b=H0nZnR9bsWKU1TuqfoneU58n1//SZzG4Jcc6CUqNtV/j/0bKl0b+e0ES8COp5Ry6n1
         sV/ZjZm2LtPwREjscqWkk12qTOfWF757cfr+w1HwBrnaBH0+ezT2X7Ca4ljdP6x5QvBQ
         l34xSgE17aPF7zzpmDKjslIz+ZeFcWfrqXHVaX402QVvkEU0QgQpJO/XDwCCW7zE/kv0
         lRe10mmzSzDLpmNaFlJl6SqQDuo5xP8SEbgy2Kzej9P2FkY0gHAslK5DnZB2JWei447v
         Hq6UZLq/tapHo/eFgqNX9cNMOPDCTs+2cy5Nuk6VM0mc7Gf84K/FXdzK93YQxutML64q
         MBCQ==
X-Forwarded-Encrypted: i=1; AL+hErH+7hsDoe4uqgUxYjMHJBamaRVlTO9MO5deU4nXBdNNB/wSjNIgGPf6bGutt7IAfyZU9ER8/Wq1ykMfQViI@vger.kernel.org
X-Gm-Message-State: APuU4Z9PgL5F6nPMob0+9rEPm6zaXj1CAN7OwOtW2oOQa84+LpmKlZA3
	AqXhpklGNEGHj8Pyyq+C3sOPZ29FTJymd7AHc3h6SHPepZzftHQabIjkbeVRFQfahQiMmrSMma5
	ddGypAFQ/y0jlUHMd9wGBLYZa5Z3eaX31HqtIQhbirrj86tNXVLxbUwnlWbZ1u9VQPHZM
X-Gm-Gg: AZFdTZed3fN/4mUNJ0RmL2fmn1Gg6TYgDdNTYyh/pG1fgfkH+xIEtsPzhTAwL+G2Q6J
	5jl9nGgEwcuSFPpe6wqoCsT9vxfGswDvATjXMFxGyVCLf1lh9tqEiAh/5V2L5+6QDqPFmONZn5z
	yLQ4fS4rmHis59y6yoR6E0bUrwoF4i67JrJpuEtkTobRAfb72CMOhwAnaN3Icgo7tfo4FHEFvVv
	/WMag2+QJfvkgUyoWqyzDnRbaOViJQcz4xT5ky6QbNdqgMZAgZWe/61h1n1PpKTIEBMtdN+6zT7
	eV9nqh9RiyQ8NvjSifyudz0JsLQ6bWrp4CErcxtMe2XAbKBDi0OsC+Ay2eRZW6AzW9KlWn8HZfX
	mZFqKmtsla9Mc1S6QHmmO8TaeoCP/BC8zV4Sled1IaWaP2O/NMgXW2b09ktPnm1fbsnXdm8AI3J
	rxf/pH7KW6zyDgq+LF
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr5323678eec.16.1795507359737;
        Tue, 24 Nov 2026 00:02:39 -0800 (PST)
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr5323651eec.16.1795507359246;
        Tue, 24 Nov 2026 00:02:39 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm74469866eec.3.2026.11.24.00.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:02:38 -0800 (PST)
Date: Tue, 24 Nov 2026 16:02:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Use
 QCOM_ID_SM7225 from qcom,ids,h
Message-ID: <awVEmRII9RyK-1gY@QCOM-aGQu4IUr3Y>
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
 <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
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
In-Reply-To: <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b0544a1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=b5bS7s7mT8qicE5fAIAA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfX+KSGd/gc4Xhg
 Gln+aue4x+yQz36GdXadTAjOQbVgta05pC4bn7hEAtxrNtaycPZzI3X+LW6OdzLsWRdbRyVY8HU
 Cesf86IEequjXOWsfEz1jF5mSUJ7I8aSX14cGded3wInB1dyxYVJN7oCvrTR8B7o0ap9NAERvbh
 mrOUv/KGl7te5VrJwklzg63vI9tuSkwW09VaK19GdguOf4MZz6g0cDDwPRK5nIj9B3SEBmAYRWD
 f66wlKt9sa6lRk6BwNJ/kf0zkMozBd2mSHY8ZGWIlgYKAMAelvD+WxRjFWqswEdjca2dtMi6Fjj
 8iq8HE+PbBe69jHkwZGQQPBQk7YW6Uj2e8pnJQfa3Y09XxdV83605oGIKPjpomREc0jhpjI8aeK
 anbSRHiTlgZA/X0ew1OwO9Ck9qQDA4idApelB+hiYmvUn8Cc1mmNGHFdsQjaGRQymDuwhw8hLy3
 LRxzIRMkx9ZkgdhoY6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfX5UyKsFUuajeB
 +971EtB5Y5ogzaExOh6XzT1sl7DtG7WcRkJLOmIvTWPw+1jWcT1MmSFCJIZ6WFLERLC3g8tYoli
 R3mqL3x5Xp2CP1gedzBiVnESfkAH/8M=
X-Proofpoint-ORIG-GUID: 463qmstpYR1xviqRfD083gHp3e6uMxGe
X-Proofpoint-GUID: 463qmstpYR1xviqRfD083gHp3e6uMxGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240031

On Mon, Nov 23, 2026 at 03:46:34PM +0100, Luca Weiss wrote:
> 459 is just the value behind QCOM_ID_SM7225, so use the define to make
> the meaning of the qcom,msm-id property clearer.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

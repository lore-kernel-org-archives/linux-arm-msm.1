Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4049442FD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778070; cv=none; b=iK2yYvJRvi1BgBojZw7uW10tspo9jLQHbXyisOeGBg56CvapkaR7aDBrqWdyhXCORt5gyjyZ9+OD+pbVxxNb4tHQvPzjwk6B9Jz9AY4S5iQMdHeGjOUb4h4CgV8SbIEGr38e1pT32GigYqMDP4oUQ7O3ozBuyV/xJbkhJA5Fubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778070; c=relaxed/simple;
	bh=kxOGenXPw3URL2xlgr4jZoeQRO0yAxVjeXat1sksctY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0d0e6xWtaZlW6mvYQu7+rxK2xLcgrvPdvOFAhFqrkZb7tb9y49FGseaMkumPD3pVKCOxcQBrMmSGpp6tXaRT5V+4tFDz1Kx+mEe2zSHe3AN7xAcgrci55XG1C7vgsf9A617qgLDutHgW+MS+6p5wEm8QNRYeTSJTWTNTOdxBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjisU+Ho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtzsMoqX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjisU+Ho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtzsMoqX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bZbh057373
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B7U44csnCa6ooBL9+cpkicrs
	W8Nc69C46BWsRVMo5fI=; b=BjisU+HooTVbKoGyUXpTZ1N6+Q/VYaYK/1fnrwLK
	gwXJ1LG7Q4m3cBMj3SM6a6tlPqK+pKqPOjUB8sjXPLj1xzw/28+wty6cNxQAepnO
	zkXRmuucNsvTVTHjL2LAYtH9j4DhThXcFf2h9nsrOSPCKRNcvfIBBWznY/Smt7UW
	9sOyPuCmKUIucTi8dMJWfybDcUTQK4h8d0b6KpR2IbInvAE+ulV3reW6KHIR1L/S
	fNLOtnMjfX1QJDmN+DGUoAklHb1WekWP+x2Hup162nWimzx3N+rqbYXNLOCM7eVr
	vLb5PplkXqR+yYURhHYOUxUAvcvF+rRLU4CTJMvYL2+GhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqge8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:47:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939281526e1so233031985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778067; x=1789382867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7U44csnCa6ooBL9+cpkicrsW8Nc69C46BWsRVMo5fI=;
        b=BtzsMoqXdLutmEvLn692UJFZxuRDoQ86BNooERLR5XztYm8UbAvCrHObOv4+Zrt9wo
         M+WH4dYOjY5ZQK8CnNiMJXCE/oK+n8h+TxkiDnjcxDHU/jgcEFfiAn9KuB8pDHwNphni
         VckROWJaSC/dzXJFPspMjWnKHbAlIwLlvrEhd68+EyaU/vHCSTUPcaLxFg5asyUl5k2Q
         f/n5lErLh1KIuqy573ebhncFMWCgk8EbjRgA2TdzfDcPIxuVqDqlIOC/ScpxTs3oQmNs
         0f1fRjg6kuFtwHPQp7ouILkJmTMIGKfunnSapDDzMVRyStU3erPkBLOHWU8g5fHJ3e6j
         4dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778067; x=1789382867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7U44csnCa6ooBL9+cpkicrsW8Nc69C46BWsRVMo5fI=;
        b=inf9y3gIuL+2O0wxspPw6Ipht3enVJOhnMa+JFD7PiN5x/EyQk89byhgCzFjcgbkEK
         LejA5r//h2DPsug7ptmPtfRclCXOj7X0+4GqZGuJ8ZKAse0uyA5xb20b7fUPSpIVVDa0
         /CDlgAlgMBXnv09Bo3MIH8TXWkerTaXXrDG33Uo+5+1j89R3gD6sMEzvQxSKdDraWMy5
         PsIPAy6LYwsiUQ8IHyb9qlXrfdNWVQlyKaSlRz89qgJDuOdUw3Qn6cTUh6U0dawmccZe
         Yf5KgxPVpq8qdPwIpaR/ejJIWbgLzDzGUSeBVo9cxc6Ewi1PVmom5qXGU1C8I4+N+Ijl
         gPWw==
X-Forwarded-Encrypted: i=1; AKwUvBzaEStyCN0rSMGOQ1stAzGYkwbhHqfjMTV9tLI22Zm84HbowKN4QjMhPkThm5YWA2969eiYs4lb4XXNCFwI@vger.kernel.org
X-Gm-Message-State: AFuF++njalgTuPmZWnm9jlx4909PR9V1ewkHBS+heFCa3oRgkn2qWy2y
	BnsU0t9X0SxXLddnTqD6zB2MVpaa2dX/90T3CUjt7Vh/Eb+qSzQMpeOnb8geAOVI83i89Gbw/RD
	OvdIZf1mVX5ICHBAAGhciyOvQm4+Y805xllGzeSKLwXNIYXfc8RDUcjthJS+v9Aydg609
X-Gm-Gg: AYBFou2I9lsxVdQN6ZKNv4qMwGoDjJwu9A5BXhSd49amlm9cPVSuRcIfZUXgxHtdhVh
	bKh6IVCXVKfhLkgblN8wRVBxpiMkF5KfM4Rfj5mipuhNWEAmfNBxbpmS0rL00EeA25iL/0qx3pY
	sf1QK4z/O95RFd4hRucqLyOxd5ryOZNqeZmFgGy9zGA2C9wbmcLDcaVC9S8oKcsFnOW8cHlNl2B
	TkwZDhXuknpMuvHBIfRisZipSPYejFAhoDlrTG9iPDicfgBbdpn4qB6otAbY5v9GuPxIxAGxqRx
	HGD0ZYO/w+qXc9EhdzAAoX0XjKc+NE0qA7m7KH/jG3Dtfw4CmktpjdfHenS59f5NGqQhdpxHXpX
	YZvddNoCorX5q
X-Received: by 2002:a05:620a:2991:b0:92e:e559:fe6b with SMTP id af79cd13be357-939803b2bdemr2327916085a.7.1788778066710;
        Mon, 07 Sep 2026 03:47:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2991:b0:92e:e559:fe6b with SMTP id af79cd13be357-939803b2bdemr2327912185a.7.1788778066188;
        Mon, 07 Sep 2026 03:47:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm445511305e9.13.2026.09.07.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:47:45 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:47:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor
 on CSIPHY4
Message-ID: <zli56nevwvyjf4etbdz7nsb7nwgzx6z47rv3qbd3lug5ner6lk@4yvccskfjctf>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-5-6c2ced5ea5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-glymur_camss_dts-v1-5-6c2ced5ea5f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX8Ew3ohNbn1sG
 +qZLeAxTAfXnLQgIWWGoCOfsu/NDcqGlXwkFrIXFVY36kljM4pBxkp8dsCrNSCct7fKRFKlghmK
 B2z1liEHhKnJfsyo552EWahwr+yMS1GptksClxuhitlsPfAqNPLEq7vK1bB9i//cr8Qabhki8+B
 DNkduEVFyHRKy1qxb5JCxD6Z6B0q3U4SwB+ItHKsK3S8E6EDIQTms9Znk3Ho76ro4tc+hmQPn64
 TKQDD0rX7HAObudBFSVR22TtZhDFooLteTQ3Lo/hwsdmbUvtUKJbAPTwC9i6Va/8ucyg11Zr97D
 xsRizPsCPO7Y9q1UDqU7CRghQq5Q3WrXnA+b+uWWKXV2KPBHDSzr9tTENp0j0nxWEj5nU2/sKtV
 r4eSgSw32K1h4XVukz0znBeQbxxJHlgIUAPHLhFosStWE4BOWR2ht2RnchSYyB0F0XMdMyJGzTW
 WL6SU4dG29Tn5EwaFVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX8wl72GodsQIF
 MInX/4UhUl3AGpMKux+wTVFweX2lVDWPkyzTUeAQm5ZJtV4aBEZkkhbB6Dsd5oJBuhIMfuI0gNC
 GN4IirSYw2DCe84RZP7VQzsg5mC+4Vg=
X-Proofpoint-ORIG-GUID: MtOafad89HcnJoaduZAo3KJJMHUdZI57
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e9653 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=U6dZUNP4vHUEOJ_ekwcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MtOafad89HcnJoaduZAo3KJJMHUdZI57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070117

On 26-09-07 15:37:48, Nihal Kumar Gupta wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
> CSIPHY4 in four-lane mode.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

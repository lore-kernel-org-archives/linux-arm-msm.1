Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536168;
	b=0WD9fpzV/WAu6ywG+90oObMn8KeONvUNPjFA12ML8kWcwmkMxccKBmZHc8WjKPNJSs4Y
	 EBSlbKQN0TesZ8eFZqLxSUqYYI4oMXt6kkRYsBJqTcK4g1lEV5eGyjqPFv6544gneuHTV
	 tsywRYJGmY7T7bUTo7bSC9dty0Gw1wPVa6tHHAcFGOcWOg36ZSYGooFZwlTbzS4D6iCj3
	 v01hdEf859xhwerGKUffIRNCNjIjv5VqyjEkQ54/UULNWYBv67ia6al7C/eFvqGvgpvzd
	 gAo7wAzmt7lb0uVJwRHUch+/v33las4XhL1G0aSfOg3JqgKRcEfYxmLRmNVFFXe+6dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
	b=uroUph98wsqOSeutk0I/x3BCn2JvhsK4Ip1uE1JGFh7sewg+Iu6S5YGy/2OSoVASCnBV
	 sU1KS3NtyiaGq198SlzUZbMQhjIV3XZo2LsXwnDv4iH30fK8B08/G9zNOrCwZA3+DEFHR
	 FmXHa2CxGz+IdraYDQNveCey2RkcQTuoUG5pCGD02c/IHV2BVMy4jXMrWp7linqkt26BG
	 o7mQAEPCc/7/oc6oMchFOEtT/42A9fQFPTCb/Mi/+0F7m6z/aiKZQyCd/0ENw0lIpSxGy
	 hSxuCQ7UckLY8x/RVLzqlFTP5GlDJ8al6+ki7Y201CaGZoMJVdkln2l24ib+tEP3Brg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvK4NXkZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbimFH+s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6636606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6636606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvK4NXkZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbimFH+s
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLC8i1215403
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7e5IkpeNb6Jnq3ekR9vD1xEn
	To2vym3AHpRb4B0Ibcc=; b=lvK4NXkZVCfaLQE3CerZ13b8vyja8k2emdEbwSCp
	vHLW4KegKzU+SUm3+j8urcgcUUuE52ETu6NFLJmQjjGSWXEgZp38p9T28Bws03+u
	5SSwEIWJzZuMp71ifrUe28tpmZR6mNHQttxtVY6+hcWVEnuOYFS9wji97Xs9T+Ra
	eeyAzwGirdlPf7dRh8e3GJ1wCudn0AtQiKW2ipvSl6BmEBZ7KYbiKkOaVg6Edj4T
	dCKon/cjBNx4fg4qUtLiz5ZcetPeAT0pwkF76torbJ37iyBgl8MWZeMc+yU8ZC3X
	uLEdmh1BVvA4mlMuVDNiE9xShP59pBVtTmB0UeNpBd7dTA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpjndm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:02:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so7517303eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795536165; x=1796140965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
        b=UbimFH+snDESKV4g1/rdj2ph9dB4guSJdosKCagC1VHgKkx/0f1j6t10Am/KlX59ik
         vp3hl8bCCnzpeSldVHikw0i7TzBaW+0JYk+s0HCgzEDRqaIgDI2UvUPlzBCuinr3+iAL
         kX/OB0b7FjylV6lcqBBYU2f0lgqazkyeqJHchfYfOz/t8QMZ1mNM95GHUd1pZVDxpGXn
         ux1tAk6MkLGuZFrHx3cIZTatj8qbgH2SI6FnrkQ/dlw2w+b/T4/rme+h30UhZN8ZYuvq
         ViRarZdJ/fcUWMS6l671WB9ZzI2TBLisd05oq2aChIhR02rmcfD4rPGLx+pUFqGSDWg3
         BTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536165; x=1796140965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
        b=cNDJU20Bplui02Iln8pg7ErfAQscXXp6mTnSonMcgdeSVQd3XR4joYejFN8r6qTC+v
         vFuh+5sgTYR6ifJhf61ieShyy+Mgnzv/PV0SCcWYr6XUX5vEg8sJNRQ/0NUlGU052mcj
         tjxnxwmls478H5DBjQzoq7vH5Env207DMCamUeIf3qfuclwrgDC+spSnE6BhPAKKfZCI
         cehH9/HFB/qo26XGHQgjluuobu4MA1GyB1g3aMV2HqyharH5gVsPwhGeKAxwU5qN8Y29
         YTp+xABBNEWw/zdyh5eRuAVxWjPicxJqxEZ9e15Vx94/HoSUi7ETb9rAux6Ccm9J6AAV
         bekw==
X-Forwarded-Encrypted: i=1; AL+hErEpqQTMYvnG1pYWToairmSBPI9FI70MgL8JG+qCcbvFAzHd8m8jZv+6Gw2yJD7EHO/KQEg+G6LGD0/b1QtK@vger.kernel.org
X-Gm-Message-State: APuU4Z+cqFaSrrO2azTVqhLKsolpxsGUdJQo8NDAlpGni7Piwzm/CLm7
	nj8tbaUoyVzr/ocdS3qXxu2ZWt+WR5TeD9TtdNSRwzY3zFlPyMwpopX1vqPMrxTmQeHE7BayZGk
	qKuGuCLiAfl0OYDVqTokbuxVFPb44fTmkXKfj7ZZ2Q8SeX3I1OZR2vDsQRzRAb5MHbk2E
X-Gm-Gg: AZFdTZdaEdBve9hoGS6f/4q/msybkbRnE+l05JX501UersH/b0cOHQfgTM5WdERgT7Z
	ZSjmP9LlN1TpNJiq7QjmIDGYTzaCWBhDaiT9HeEnkpIyTI30jyKAoz55ThmDL6YCvjLXF/kQHeu
	EOcKIWVEVJUueImVoRr0xQeGGPqN3oOIzbSV+2KkMqqvbAlTeu6VHibhxQb+TQCoDggSt/rYbqX
	iH+yA5pIzR1F7hSV6lAbfAn4pxF8WhQu/ku9JSyOaZSw6BM8NqzxzQ7Slnxz1kq8jUupX27L+Ix
	lb3PPvH3Qtqo8RtupBVNylo1eW/SyXPfrB7kK42gFEPZvvBjorsUpTjJsyqomeepBzq01/11X6i
	2Zt6fTvhm22+LGBhYtnvw9hl/OI24foRlKZUvExXu5Wvt+UmFpB0pTLAb7BgH7w==
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr15168432c88.32.1795536165196;
        Tue, 24 Nov 2026 08:02:45 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr15168384c88.32.1795536164374;
        Tue, 24 Nov 2026 08:02:44 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm51670984eec.24.2026.11.24.08.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:02:43 -0800 (PST)
Date: Tue, 24 Nov 2026 21:32:35 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Message-ID: <awW1G1Aou/65UZ89@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
 <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
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
In-Reply-To: <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfX/eDaWPNOMklU
 7IxDZbLb5Im9BGhadxNswOUu+lcVaNvs5iu0EFhvRVQNMLM6C+ADz0VPEHxhiuBHAyTp+SQ2Mks
 eaTho3d3IRkKWR1AO3oo43gFjlMvtdp0pPCs5jFPLwg8VEqeOib47iIfxPIgwRasf7UrwmMrHpc
 ozi6H7NqO2l2VBH29MooX/LVvzl/Qk9jBpHtr5DDQfCyQCnGV8HmxiQ8d2gye1yVDxoTJ2UZCUS
 Y3gQrGaGsPHWu+cD1CS2GQIndY5h4I/eCmI2VJMjH/E+xA2pceBxUYpRqSK7IieOhYs+y4Obvgn
 s5pxyB7L1wIr97IWr5WMAF5LnV0ib2COWsmBwldSZuxWB9iS6jwvobPI2DDNfO8s9dAC/OXmmIA
 diAqF5l4/H0jRieb3XzS2ivk6Tlsi7tGCpjQmmtAMRmfWIwCk34FrFL9VSqgmKWYSqs7oG5xXGo
 7+wFJYIqySMpt5T7j4w==
X-Proofpoint-GUID: TT7uWc-_2N336kqQevFAGAfNTFvTmJ04
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05b526 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=kppLnbNoFjUBNF5CwvgA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfX093vFB9HrBPj
 hZkHzPOhv1Yhz/Dzn+LNKD8QOHZdlcTDs1nwBfuU2zaW4ICZkE/sMHvc5VFxajyUxJXsGfBTx6v
 BDBBaOsT2gl4mlOVYMU4pA1R38sJxGU=
X-Proofpoint-ORIG-GUID: TT7uWc-_2N336kqQevFAGAfNTFvTmJ04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240062

On Mon, Nov 23, 2026 at 09:29:49PM +0100, Andrew Lunn wrote:
> > +&ethernet0 {
> > +	phy-handle = <&hsgmii_phy0>;
> > +	phy-mode = "2500base-x";
> 
> > +		hsgmii_phy0: ethernet-phy@1c {
> 
> Same here. Broken 2500BaseX? Or properly functioning 2500baseX?
> 

Based on my previous experience with Lemans based boards, I think its
the former: overclocked SGMII / broken 2500base-x.

	Ayaan

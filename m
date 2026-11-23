Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413362;
	b=4K7N+C6HtMG2UFwtFAU1pHj/QFd5hCNAudxHeLP4vh7RqQJMg4IqSAJ75ggvwRckmhzi
	 8ORDv39RIigS2yuhNfX41ax64T0UZ6+/2SLQfObC/PtFI2Aaekk9p9Sdi92Jy6PysJkAZ
	 eK7fWQu1Bzpw/rQoNbtljy2Gaa1f6AAMfEyF6KcZ+0SkHsA6DjvIsrROafYHpXDDF4ktH
	 2Kxl0WwknaiASsIO7dqovUIBLBX1EI3Imw+5cd+gMlbotgsvP1Js85GHNUKaEejdo7TNW
	 o6jiwkCL8sAT+6WyUtsv+2kou6Ca+UeZn2uHxkfewYA5qJjGhfEtPg4F/RpfCDwm49A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
	b=XKnQjWBUEs64rJMVAs3EoVgm9dP/vAZI7LWWHnJHDrx23K/TtaoEvj8zycSWk+KFmoRP
	 nc0gdeFDHmeZpUrksvIXnj0PfLwx+rQvrfeQKLBISZa/heb/UFwsZauQGjRZm+LeWZy6t
	 v4mdzGIdccCzaI93qLOWljGd6SBFxqys8xfcVKPEaq8P+Nd9zCo5qm2uXXZ7iNidnko0W
	 4U1GJPJAu2mHshtYbDih36zYO4NLeDb51Ms8mg6Neovldn/9WUo/k050pQAnlxQD7LNAc
	 Pk3RVNr56+3iutQomzMQlcSg0fFbE7gVNvr4CXU7JqRX4jIPHPSA8oFQZvofi2PdZSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOE0gCfq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzwss8ob;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E8606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 913E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOE0gCfq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzwss8ob
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN519fn3780388
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=; b=eOE0gCfqpxyV5Qso
	NqjyiJlOEjj6QZP03opjEcqTIIF3/iUfHD23DRD7g5EN84ZeYG8I9c38ZB2x8hGs
	ybK+DOGS4oQ9XZwhNH3EtCCUjOc5Fi3pbbBGeaqwTP2GdaEAbiMkNuNYuBrVjLbx
	HnBoZkXB5KPipz7ZBrnSrWJkhXWg7RvBvZ7jAJwv/OMFUyK6JcrXIpKpDe6kidX3
	55XgWd6oaHPkRHQOOIYEJJyyDqpjJhuAXGG9QaACzBLFiMp184CSqS5O22hXfpnX
	VIVH4aeoVUrMBBgtQY6074VBR2Fyt0i1963xQiNoFGIEiOoyfV+n0NM+ob7CCoPw
	bgQfkw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk57kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:56:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f09a37f41dso3783225ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 21:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413360; x=1796018160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
        b=fzwss8obbkxIFCEOKHiMc6eaZiNBCNNSrqlpvZi5UEPoPQcArnsdchO49GpiXFz73X
         +59TzXQMFbX9W5hDhzBnzCIfRAZxBwQUfbb0jMOVqxN5BW3+CPDN8qRP09pfWw0AXhvP
         3k0PI2od8zL575EVO7UMC+qfXQ94VKlG4daCPbTUuebx/leqbPDyaXCrt5YijDxW05P/
         6GM6Br0FS5Y3NPij9d9pJvT8lauNC5ob5P44vKy/5ussCPjBl0I8cTTZL3FDnkkadx1P
         l9of+InPcOLDTmrLSoV1oyjAI0S/yEkG7jrElIW/WNb9A5+1cr9REio93+GsKlSspFgK
         vQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413360; x=1796018160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
        b=PcVHGaIRegfF0ykm1rGE5zzsCokQ70NsnCuOeux01KwPIbYuQ9H/AKhUKjyiclauat
         HCAfVugJp8Lq7rRH+Tb4RCqdR4Gt3Nw/gjApdEH6Xz0iB/ev0sv3msBV45LsV4mNLTCa
         /QXvpB2NTlpfqilL5UxowwHwz1zv6cDOXG/SkaEIikuUFSdkySxDk4HTdrNCRN6WllXP
         IUCLaVS1w/NQQa5qYoKsFd/i7VdsRLIE6EG8d72Z571vJERYs9EnhpW3W9/8wpkuUfyV
         MKLTxHkOz4g+IvI2UyUFlMP88Bz5s0hlcSq5gXrzudtxx6c3P/iMLgvxkaKkNc0Z1VO3
         B4dw==
X-Gm-Message-State: APuU4Z9M0QYOR6a7BdfkRjx03UU5qyNQXym0E3rEs/050+3OFjv6EuK4
	IPeUsO+TflKxMgUCNdhD1O/a4nFT0/zYXgHkvK6vjFO3wFX4TRgj+3awaoT/zhsrf6+bkuNhPij
	Vg9UVVAP47Mli2N01T8lsgPAMsi7Zmh78jdNpTxl7mFexkcZMIcewy0t8Mq9PEtazOSAv
X-Gm-Gg: AZFdTZchY8GfuEIocBw4AORk2/ubu6qo8bRd56bhGWcrVdCCmdPLljqMuA955JPTarj
	82T4W7gu2php8VTNe4XmAAXhPTYESXEu/Z7ip0ndiQmX0W60IvIQ9Ws70i5/IW59h/xCoXz4B9A
	5T/x/BDWa0Dn8h9/+L5KZR6DC8opR+85H+A9fMDio2JeXhMTfD9//dvBwqIEtyMssIfLq8lcsif
	mEgzVtAS9qhltwvvw7PtZ8/QwFey/nTXzA2nB8EAYbh2RWMYgshcpjPsBFBpFeTVPm4bYjorQjD
	F741ffaolvlar+sqZBzztqAAZmArUnphEW0na0Sjet4hGPlvTovCvZZVooobkbLRYNZ/NEHxrWP
	Er+jxGsYudgokDSks378Lur108xE+WEsk40G0C+iagBA21Msz7bmH2jDA5ioIOSArCYkhgHzvZt
	sisg==
X-Received: by 2002:a17:902:cecb:b0:2f0:45a7:5d10 with SMTP id d9443c01a7336-2f045a76530mr96395575ad.8.1795413360115;
        Sun, 22 Nov 2026 21:56:00 -0800 (PST)
X-Received: by 2002:a17:902:cecb:b0:2f0:45a7:5d10 with SMTP id d9443c01a7336-2f045a76530mr96395405ad.8.1795413359684;
        Sun, 22 Nov 2026 21:55:59 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215d7sm45538685ad.65.2026.11.22.21.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:55:59 -0800 (PST)
Message-ID: <a643aca3-e1de-468c-96ad-d87745c40574@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:54 +0530
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
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
 <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nzt6jCPYSnhReSVTb4vvIBG4ut16DiRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX1ikmI81zuoJe
 +K0ZD5P8rRj3ZRzkpYTVb0HeXBXlYOTAEQO594ZO1nzfsR60DIdTwsUGuNyxyCAaPhIdsKMqbhR
 kTu+34+/drRHO8q7Jk4cXSmPCXERcbyW1Uih3B1pE2/OC1Oo4XbiwzYIpdQnkNtkpY+rl3+kzNq
 rgoS48EdJtpysLOJAi9zsM3eaQBXNMLOnl0MxEHSFF+Bzc5y3rJ33Naj4MfMp54Qq6lVwdv9LPC
 Po+Slg9nMXuh+kndawgv55xHteKUfMMpBKqiLSIPrXXsuWbrw2ePqzaLCwLWCNLX/WC4QT+NKD/
 mXidQ/WHFtCBpSLZagx7CK6/XlnsyXTzp5Muc0TbO81+h5VL4mmQ1gFQbwjfoVBro4nn4093/4y
 uiPpwHxTRt/Tp3JWyRlUlG+no0WRZ6guJ70h97mcAGHtHnNXRvVKK/GklqbMyJrxMnRG9Az3hyb
 tKC10Sye9w1dENlNDKw==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03d570 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZqXg7yOw1P01-A-HOdwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX2Do7kPff5WDe
 QYDZIJkPiFFC+9CCq+gnZn4axM2rWwMGMw+tscgUTFSkPyVQraRpLerl6Xh7KkyK6ejukTDiQQo
 xDzbPDOjC9Y+AWX3PxLr28TjF8HZ+3g=
X-Proofpoint-GUID: nzt6jCPYSnhReSVTb4vvIBG4ut16DiRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 23-11-2026 07:16, Bryan O'Donoghue wrote:
>> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
>> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
>> X1E80100 CAMSS resources.
>>
>> Signed-off-by: Nihal Kumar Gupta<nihal.gupta@oss.qualcomm.com>
> 
> I mean this is a bit of a convoluted way of describing this.
> 
> You have one less CSIPHY Hamoa has four Glymur has three according to this patch.
> 
> => Fixes: tag
> => A commit log that says this
> 
> Talking about the ports doesn't really describe what this patch is doing.
Agreed, I will simplify the commit log and describe the actual resource
difference. I will also add the Fixes tag.

-- 
Regards,
Nihal Kumar Gupta


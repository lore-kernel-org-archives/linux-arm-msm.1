Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BDF472774
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367441; cv=none; b=FAFufF5slgeVDTs0gpS0roQUIiAuRYXZiY2sJSfD8o+G1vfloYPH2iYDph4iAwduZlMmLuRASs5cXh1URLsxm2eCpA+6pqN0vME5e1w03u2oVjxuX71ANyhEEANiS9BdihJrSZhg8CwQzm39n2eNPRiy/cE3fIObXoKlHCFeur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367441; c=relaxed/simple;
	bh=4yM7CVQmNDTPX/vEciJLhHIVlge+DSOESvRSzxjhG1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ak+aDnnx1vCIXQDWFQ5EFEmaBhn3J+5fyo0kwmahO/k2msy5RK6Zg5cOWLAsF9AwWuQh8nspHufE8GbYvspBLagAZ19UTOIvcOvDf+fIip5rfOQOck4xAcNI7DW0rLcwm+WS0wI+NgJdfbAugcjgenpYxOXBs86JubK1oEHr3so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpbru3pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNX/0C3B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpbru3pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNX/0C3B"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jhiw3298365
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 10:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=; b=lpbru3pe/3TX0S5f
	Vz4mlcuk2Jr7OEtMleywJD+8IT07fFgr5LQ7hD0dtRonIwvvYtlRBxCN0dZBlfOY
	BrnChFo2mJzeEIA0ikFtcEpykGw/t4pDoQ1GeGA0LZMksYbmwFARVSVb1sz0jMAW
	Cbl/EfxQnj6UCXvaky7dGJiyGkZOyByVkm6wwrLhQGhiiEWKDo28DcjifZLudpQ6
	5rqx6sk3EY13b/EegfDYhUVPKllTBZUWiL3GZSf5zfzyOX+OEltjQmrbwnYSakEj
	jVAF+gwqV0OrFWPdBOiomVY6S0BPzI/qe62PAlYFFRdm0uJkM/53rFiGa28c9oD3
	VOL9bA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrjkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:03:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso544451285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367426; x=1791972226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=;
        b=BNX/0C3BrVXJe2b/PW7Mj5357M8toh8OufEY0u2oOO63JXS6F4z6+4bLiGAgJN2pZ0
         w638Gqh1kVxcHrnB0VXi8yox6ExD10LbxVqcXQOBbMJiypByWnfTeEMuB4OW0EAsridw
         YmUfAVrg2UU8xK3d8b0SDlEZO/RAB5MHmHTLfUlewXNyRQXDlEp/yQn3ssJobeba2VfC
         S3rKlGWQBR/5tybY3ehkBPEoUmI+3UNfC04F+so51GmDV/sf7HFl8tBYSm+VZYFoBmL6
         L9mNRHOAXJkRWuPQWWh+dPQ7bqyeWac7yhzL/2/ZO6AUXQLkcEpF1CnOpqNOdnKj/op/
         1jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367426; x=1791972226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=;
        b=auw1Q8DExyP4DMorXfEqO8EXMJfG7AKIoaW5Wsl5NSIlyTESdIJmcPS/E3czWNkXoy
         RCZKHPEs8P3m+gLhyVlyBrRf092WeHVTkA86vj08m48AZ5210HkZiiCsHDafm/suW5L3
         D0rDda6KYMn4BPpRLAF0OZBvMyf+351ZxlJzjHau8gJlPCdjrc6drHUwM9KUV5krCrQk
         v7Tb3yUsnDxIYFSnkvekqrXCyB4bWWHsGY66RgBm2B/gAVBouxlgoM5fGFf7asJ+uvdu
         095YhPZejIvfqWBbVqmYwDWHjL9BYM8lY9516ThZtWSfaFTeDNZpodVSpAr1NRb3FH4+
         04Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwx8T7HhFdTOZG8WZHMzFk+jbtJXR40zXpN+gv5vScIdsJF584dPd0SDkDQqIOSCMXeYq7rxVEqfgXDqprO@vger.kernel.org
X-Gm-Message-State: AFuF++nd/5qlh1wDipg/yFqxkNwEwlyUzvfwnYRjp6hi+HAu5fcmp6sj
	AGHNZeDn2e08f9u4jQX1XM2KO2jDGkgm7+FBruckILp/aQI3BXHbqcM9Taf00rmK7V2ABCj8qHZ
	Tgu9gMgSDQTZ2l4hioxfZpnetiXAqdZ3lTCN5ed4WuAsiRKsRoEfgb/L5AfDYFucXk2C5
X-Gm-Gg: AYBFou2fHHjqN7uv8rOp/iNa8cGc/EVEOExfV8OT25fapvoAW38kVi4Bzv/eAggZW9g
	eUk3brKEpCtWhA7m9MGiXt9re0gcQJPGCekR2Rh0/6ZpNvBLoI8yn5WDM7mjg8vsuV2zMeqxgl6
	Lpwyx9AgYX/ThKHL4B/TUKlrZGqIfBRz9RzaUbPyZD0Whsez7LFFaPlJjyuxMXvr0J2ZxSOHXb7
	EBZPlnWEsX2+3NOoDIxsyQMonptfewXbT4dZwUSAu0YDw783DhQgvqlnRWcNkFjOWvM2Zbc/bx+
	WXrjtJMRRZGKQCPeqbaO3bX8Q2dtjz0XxuJRDuOcpN0tfgFtaGkYhnI6g8FwhguU4+ZHSPySJy2
	N7aT4+HVE9wlDLoEHsMGkTNTl+ixgmjOlYyfRq+1R
X-Received: by 2002:a05:620a:2912:b0:936:e938:b07a with SMTP id af79cd13be357-93e9b345658mr339530485a.8.1791367426198;
        Wed, 07 Oct 2026 03:03:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2912:b0:936:e938:b07a with SMTP id af79cd13be357-93e9b345658mr339524585a.8.1791367425692;
        Wed, 07 Oct 2026 03:03:45 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1144csm4297318f8f.23.2026.10.07.03.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:03:44 -0700 (PDT)
Message-ID: <e352d91a-32fb-413b-85be-a2d30083eaea@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:03:42 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] media: qcom: camss: add IFE pixel path support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <e6a77fb9-e8a3-44ae-b8d1-76bb2494d31d@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <e6a77fb9-e8a3-44ae-b8d1-76bb2494d31d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5LcxLYmo8G4B-jNUX9ULqkDsBNAyJjDK
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac61902 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uTK4J-ebKsyKmJgbFeIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX5mgAADxSLxJi
 v1kCuJsgTod0Y6f7p9QCrEDccunbQl8TXkGigjGuorrutY2DB2Uj6ABFtrs9kqnVlbk4AH8LEjE
 NHOQBKFhqS359HxDjpdonGVr0wJ9Dak=
X-Proofpoint-ORIG-GUID: 5LcxLYmo8G4B-jNUX9ULqkDsBNAyJjDK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXwKiGOPt/ZmB1
 r2chNWE4MUmk/51c7VxLCVGaEWsFqgiaCnV420R3q1uWySZGXOfejHNjockWaD3Qv0v1DkHRMPK
 sFW6wg6vrN+JcJQH1RH9TvrvPNi3jGZsFjkHkGLYnCZyDhqwFtlGAuVMEbxPis69TaW/ViBPu0i
 h+unGDfJXo6ZRJnr7gOaVAsEnvAATYIr5rUHHlURJ6mkQ1uGSSOm/wxL9S0AuWjJZoI/LT+1En8
 kFQxiztG6CgJKcZqeth8G0s8nVzTvwIA1HZRrtu5JVAMqCLpk5w8qmvdbzK6I0+Pq1/ijIvvzcc
 p7wap0Xl9ms2VGjcnaKRFaLjvy8S2s0amy7jGzpG2KdBRpDJFI6NDLE0jf800kwpfj/iVhSUzSm
 OF/WMWLH31h7KEYfyoURJMoL2vZ4CzVJOWqdDkNKqA4BPlpwpuAw16SH71BhmqeqAEHjhlGVeWE
 vSAa5gstTsnQbsj706g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039



On 10/7/2026 12:59 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> NOTE: Bryan has posted RFC changes for pixel path params and
>> statistics. This series was ready to be posted at that time, so it is
>> not rebased on top of Bryan's implementation. Both implementations
>> share common parts, but take a different direction towards enabling
>> the pixel path: Bryan's series extends camss-vfe, while this series
>> introduces the new camss-ife sub-device described above.
> 
> Indeed.
> 
> I have posted an evolutionary approach - shifting from and fixing the 
> original sin of mixing write-master and rdi indexing - as a first up fix 
> to the driver, and then placing new features on top.
> 
> What I don't support here - is a parallel in-driver new driver that 
> leaves legacy stuff as-is and just shoots off and does something easier 
> in its own isolated place.
> 
> Great to see the willingness of qcom to follow up on my lead, lets work 
> together to integrate your stuff on top.

I agree, lets work together to move forward on this topic.

~Gjorgji

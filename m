Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007987;
	b=SznLJadXu03W5mkOWN9Ycu0edZRpwdJqCrbd8bRsuYvTDXAIXzki1CTJVwM5wS3zpjfy
	 U9N44ToqXQxnwEoFQxmd62pnM82lMsQGrlujj30lqA8rhYmLZxeb5pm6GAAJ0IzE74Yie
	 CENCbHVr4gdGwVYkmk2qqg16OSXd80/4tf6rbys2pZj8z+42wRKrnWWQuE2JTh4/kWyse
	 iSp5mwWJclM7GSgnmArctiUwnajzgMzLkJ0LSXGmwmVZ/njruIk/qVI1zphK8MIuX9xmS
	 WKmr1pBA3yp01TBkYqBwNDVFyf6nWQf0fQposv3fMFcQF7556giqVAnm0sQBdWuFyPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5FaPGddv3jsTPg6XlTe9zmDBqKOfwv/g4KIMTTWQao8=;
	b=EdFplJAXGIG/kedoAb60GjeSTTdVgYscBwrq5jl8Xxk/6/tl2PSr8XjwSZZFGHIs/yxy
	 1JlSgEqUlV4h1tcCK/OqZduJYoIe5emizLw+TZB6ixFDyG32S13xqBtdeKHNne6bRx6cm
	 XRghHzP8ZAJKOwfU/HJyLBXKmMt8zMNVhNwyRNSS7+yCOKoICT2Ctunwzb0otD19/+wvK
	 qwQpjDcbJeVr4SnIPfzL9OFlE5d6pzatWoJhZVcrbPRwTyYg8CRhjDhuQL/RYJ3+YprJD
	 ylv3OWaZupkDITPxv6k1onyryVQMLYZPDA5waxl+ocRZXBL8O44V99jkcOnEUsA8XKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NxyqMdmK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kc7paIkW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969B606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9969B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NxyqMdmK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kc7paIkW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7bq2806463
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5FaPGddv3jsTPg6XlTe9zmDBqKOfwv/g4KIMTTWQao8=; b=NxyqMdmKoVvfLMeO
	s40Z+fdjqNzuH4HzMnn20HG0ND+xaBGNFrCcuouUvBGONCTVF41j+iPQgVk4k5ni
	5gni8uuNjA9QSJJKKacl1iHxQXdebwkrcxMuMHfGjOlfMvKlAsPK2WpYclqnv/Rq
	6akED298mhKi16QeS5bvtYd77+kY5gz5AuS0sZMXNXLTWa8fYdLZAej3tePbOYuS
	hgPyRE/iVSaNR9q7gpD6GkQRBlkz+Y0/ziLvRAS54Hz0QlnIFgxZFTbCggD1B+D2
	MpzEldAro2OZjDceWlLYrvHOqz4xfW+kxDI4NesTf1/5/PpznIJEOXVmbFV70xtu
	za0lrg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xnuan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:46:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c5ffce3f4so2644346d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007985; x=1793612785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FaPGddv3jsTPg6XlTe9zmDBqKOfwv/g4KIMTTWQao8=;
        b=kc7paIkWru6+SlgKA2gVTR2i+E8Bu/eWnbOxfx0GitogLeF7CrOYYM8bO5tDZ8+7o4
         dXTjszSzMlAXqA+pPzwheKNtZiZ4Rx5+ODpmogKVcxa4TQOjC8PmP+lHIS6HYwAa6sHa
         ePGqnewBbc2bUn8EG2GtzI9av5HUGQGZk7QqOw5LAmBnulXugcLs9cxllA55v4SZb1Qj
         AzT56y/GeC83wgrceAGxFfGdh5RfEqCVj6F55EF2MOJ7obNLzVlh7VmI3Fe7GNAcmmnn
         6Xf5NZfsIqj0j2n9ajsUH0MOEwYtxiSOJ/rUFUfPN5uf8IzpIcxmZIoXAUt2wZ3IIhpg
         uQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007985; x=1793612785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FaPGddv3jsTPg6XlTe9zmDBqKOfwv/g4KIMTTWQao8=;
        b=S0F1BVwZIKAMimreRnJv82nLjb2mRVqOryvTHSYZIcyS1jQxG+fPYXpcf3eNlEa82k
         vi1iQQyBSEdhlCTQPzm8H/+/oZ9dar8hLGs4f/InKZc2R+wPeI1pXVq+RDLNHzWcuY/a
         kJ6P3z1hGQ8S9YzSDE0n3f6qbiRdE+1UN7XjNrppxdmQjCaqbw1VH3/5sPnR3V6ghQ0v
         gf+Fe7LhLWeC+K00QQnnOJcyHi0bizBm5aNXnnAIlJRjqgldNu3lb6zVZIiyU7bw0WfH
         RfUwB9Xp2a5xMkxjc7v1m9hDHr7oEOwmYkCHPdJz9a97hw7pbWFeHF9KnlI6dPpviZSR
         Q2UA==
X-Gm-Message-State: AFq9FYIM49z3lD03x1cRdfjxcbveVhrSOCR9zAWRs6eey4Hx6ZPSP87z
	YZ5Qtmd+UvWJKqDJi4m7kYr6Z77J4iB84x7OFhBgaw+gWa+Q43hxl9jHBhd7jGy4NaB+vNOn/Vg
	YI/1wwafSrLye8OkiLwQQ5bq2Bqm0ke7jlIPvYIuMFFkv57vezE5SyLb+OCxcYfDzTBvG
X-Gm-Gg: AYBFou1QiyMYYQ5zv7Meqmt/5Y+X/LUXNZgJXP51RDe6p7AKfmfj7cSLpdBSAuDouTL
	lRWSru4xjhDZgZreRywFwh1CXevKaOwh3lhiYtt3r5R1RU+Bg/9QzkzeuwLAqoMGaFP+6dqBJq0
	IcVqOJXmQEW6zY3cuFtiJWLXkeQPEOWITZHtoe3dvUrjZv/nmZHkiG7zqy8zbn8IZY2pEUe4uCS
	Cie/XK3JKBOkaDvPZ1Yrlv4FkUCP+K8R+D8GSiJ3ajDzTdoGN+3uz4FavfHRa7YDJi1R/uLuEoV
	hxGEam+07ZaE5NOkg/hDMMpsAxQzeniq69trk3NL/aoJitt2XCFZrQQcKi0ZQn75z8NdhtAJtDx
	CSi2SM+tSrTVu3LoLY7c9/w==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1132232885a.4.1793007984968;
        Mon, 26 Oct 2026 02:46:24 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1132230885a.4.1793007984572;
        Mon, 26 Oct 2026 02:46:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650118sm301524966b.49.2026.10.26.02.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:46:23 -0700 (PDT)
Message-ID: <269610c6-5ace-4faf-aa44-6074074e0cb6@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:46:20 +0100
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
Subject: Re: [PATCH 1/8] drm/msm/a6xx: Check BX dependency vote index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-1-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-1-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OUeadrBxK5d7JprTc3iCzkOUnYqV27HE
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adf2171 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=kjaib4mTrQJa5ucwwGQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXx2t/lZihX22g
 hZSaRu30kqxNv/vz1tulusxqog+ruwF9tEf4bBRKDijlNV11+spOuR9qj6Wx6Xc1dy/4YdapIKR
 1hPwp0rXfBQco2oiFgo/+pZD/ox1kG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX9jy+KNuGKNuW
 K4FS/E/Pg/1Nj5TmB52u9wmfHsx6PFCHe2UzDR+0sv+n6icctth8OCsQsPA25tQTydAQLps8ih0
 yFo4yNUqH/Mns/CvgrMBDD9tvsJK7QH4GDCLaLFW6cljgiBS98JF32xJ3N9jdAgpT11sH9olhWE
 IavhY7XP0e3Tu8oBEeFZSEZvUNefPJxrEcPvK37SpFdPiqAxd6EpVcFcRf3TqsdepouLf/6vk2P
 WT1hclzJblhT9Xbz5vZSCHaKckeHqduQZII/kFkP7IDHwFhflEVr9or3rWF+I0A1C6gULXfq8CB
 /RoHCULmkEzZ3ya2YkMIKMJxyn6prM9UObRcXxuSh4c1iCiquw4CudgmlpYADARBpJBRhoHwvRP
 Ac4SE6mFHsi4RglQKNfbZpfkPFDjEI/EPwACSLUq9+k7m1V1Jta6L7g9yl1zNxUEFOtEyyrUxM1
 68sBgl0vKtvaiKeA6lQ==
X-Proofpoint-ORIG-GUID: OUeadrBxK5d7JprTc3iCzkOUnYqV27HE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> a6xx_gmu_rpmh_arc_index() returns a signed error value. Check the result
> before passing it to FIELD_MODIFY(), which rejects a compiler-propagated
> negative value as too large for the field.
> 
> Fixes: 020b8eaa1db8 ("drm/msm/a6xx: Add BX rail support to GMU dependency votes")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610070334.bYvBJSpj-lkp@intel.com/
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1E4F402E
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 18:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570148; cv=none; b=dx5h022PFnR98VHqjIsdonDP4XHNmSt3nk9uW7CCKev3nLs1YvXNWoatcS0JVn3bvAid1yf7rlf2c5+fHOcQ+BTCumWjFnLmEnpmkcIl6AAtw/GOvDSWijf/VSvxVwtMEiWmPO1zUesKEC2z6tyI+/hTGTKTKc5qqNIORytnquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570148; c=relaxed/simple;
	bh=0ziXDbyWvbD5wLwFS0JgJKaNn+1KJ3RxY6KY1Lnt8Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUp8b077M4GWbTfK2xsVwSYmKjqNoLAqGCjnl9GHazs8oXLS9DuKQ751/61Kk5bYwl40XKWyGb66XAe5aJ8tLdMplooQqqXLBJ46muYkL1KQ10SCxhO/LFRzD8cKWEMnjnEtHaW5Y+fCfhsBJLYL0aRRozcvb/1igWvLT1hvVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JveUUjv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrkQugnj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JveUUjv+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrkQugnj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZc6m2470917
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 18:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rOadhsIj/jKyh1WnNgo5Rfno
	LJnhvQqsGhUpPnfFs9Y=; b=JveUUjv+NuNdQxui9WRh6V4LURKtmXbrSE9xTn8N
	cwYbUWss4JodSRQ2yzl2ByGE43+ekqwqgydRtlu6BlVKIjKQLMSUBAocrlHH1Yum
	TWrQE12jkV46OAeIEGhxZwbqaKLKOIzrcm5IpLfjSfkx2vEVDNLRWM3OUJZ4mbyq
	Sg40gYQ8ezOGM3XyfeNOYlzdLDLJcZZlXKV3OOpilcjATBHjpeBFgpNJ2IeDWke1
	uvHuk+1beIgThZs303D0xqSBjOHjClduKxCgd5Br/57Wv7NCHlIJbKNEBTdYi6Hc
	1md3nUl3/tT3/UDNYo7W2jD/0P5MfdPzrd0A4D/zkYmL0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8g5wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 18:22:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46c120dfso737232485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570146; x=1792174946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOadhsIj/jKyh1WnNgo5RfnoLJnhvQqsGhUpPnfFs9Y=;
        b=IrkQugnj4EnakbIIHoVM1h/9pL2SHw6Hwa5QsJF7ibhNqDrpEznOUPfScXiNtrNHsg
         3EoHV9tiNMX2ULiIfLAjfodIXLNiJpnj4avrtFcMXBlQNLjRtHVCUjcBaXZYZvuaDKpR
         hKXN2u4Fj096oHpk+UpLsUPFE61BeFIIIIJGs1jVyLGJHGf8a8bYdRl0UUv0/4pR+VNV
         fkBJrwSKhKV6rAQ95RUlFgkxGpbuOn7fXg6VWswaRE1uuiGv3UFkX22CXh/Ffd7v/Ldu
         ybbKZ9W0f+BeKbc/jozrmGGGKpidFd1jXTvjvECjNP9Lx1envgHyZ2fynShJwTvnEdXi
         wlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570146; x=1792174946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOadhsIj/jKyh1WnNgo5RfnoLJnhvQqsGhUpPnfFs9Y=;
        b=Wjp5WpzfxiL3s9lrP1vh5DMgeKfZSVhnReIXEwZInOVNnVx9QG5svmsJPMzN7Zte8y
         SxklTEQINZQwIpkbZohIEPUf9w4hmKjJL+n8Vo4wPYPSXYeCRVj7qajDomQ8NRW7w1RM
         eEdeEHOV/VApIUD66nFVAnFLrgeCaWKfAkeNZIbPkJzVWTznbG7f56lHur/uflbueHWD
         uIigwXbqYAv0H+BrPGJqXJHxDA6+0fwL8w5u0BX4nx6nIg1uvfXK+Ut7eDUXHhzNZ9QL
         ia1frN1ZlnfbRE/yNXH3DgwDMK5JffxkAL0EwfTMHloUXP8v4mZXB0jRg+CSi9irx1Sx
         LJIQ==
X-Forwarded-Encrypted: i=1; AKwUvByQmLM+pBPEvGynS6+3K6is7axdBooPkp+eWbNxbWGaNqiuX1/PtVNIpB8IXv4oQBovpAbHU6hwE8eMNY6z@vger.kernel.org
X-Gm-Message-State: AFuF++nvYavMS5HLiMZRy8GtuzuE3Lv58v+gKuz7lpqUmGzWCx3QMEHD
	fTBIPqoKIgFhY6X24tPx/J3wwb/NFe/ESlLQ24ecLkHQqU12ZsSQNNQP2ShcDNyjrdwkEkxGGey
	TxGIIny3nAyZQxUwabGTLv7/Yawplp8tnD5QB+5348A4jOUpOj/KpUL0ChWeEhsS35tbE
X-Gm-Gg: AYBFou3UW2SpgNum9XhS8vscjraafecKDQnCjUOOOoeAgm+XyCGu4o3i/xm+zrJhar1
	nUjs6G2tXIakOsBXBS84c3vnjbnH5FGk/IEdUjYg9bjB1gLQCumIqKF+yai0xPb+kP9lW9fiI64
	rmeZqLA/vDb0dkFqogMUQvq1qfM+OqcSzR6K5se1ClIMwlaR6ypNwy7RSoEj7AESFHGcwZUWPXL
	gdVC0c17fSN2EJST7pGov1sM2BV62P/D45CbT/n2prE9Qe0/eWVpioB3szIxPD55lC/BhBLWUbD
	EIDTlc7Q8VOMavg+gYJC3P1uur9R870X4VATmSMIBYB1Wv/uK65ySx4spWZyp+uWs8RmsAXJiYt
	qBfHBuV04jFs3AVE=
X-Received: by 2002:a05:620a:1a0e:b0:93a:2611:270f with SMTP id af79cd13be357-93ebd20ecaemr446231585a.13.1791570145455;
        Fri, 09 Oct 2026 11:22:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:93a:2611:270f with SMTP id af79cd13be357-93ebd20ecaemr446224985a.13.1791570144763;
        Fri, 09 Oct 2026 11:22:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e530esm4982802f8f.13.2026.10.09.11.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:22:23 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:22:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        nitin.rawat@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-kaanapali: Enable FORCE_MEM_CORE_ON for
 UFS AXI PHY clock
Message-ID: <npxwalwxeqa7ebesvux6simtuemwx4jg6iqiltbm62hiuh74zt@qjvhinctficf>
References: <20261007143716.2161-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007143716.2161-1-26rote@gmail.com>
X-Authority-Analysis: v=2.4 cv=ONOyTiaB c=1 sm=1 tr=0 ts=6ac930e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aXoM4fymnmh6U8e-DTIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sZHJLb72BR2Fb-twD_DTdfi0itdypkhD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX7youYegpQBmx
 k0CzRCF1xW5GtvvFUN484MhMPRb+SYZtOyDqW+gdwRcVCaYyC7qhRBXZji7d/KePqJG2rU8NcGX
 f02AFGItzos/8ixFo2GsJd1OxEjg5DQ=
X-Proofpoint-ORIG-GUID: sZHJLb72BR2Fb-twD_DTdfi0itdypkhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX4gFNtkQtdm2a
 u+cz+4h9g/9wqXN0OZdZltgsa5v927s6P7UGz//zaYCRBYPZk7rBKiGYEonLOvU+OLi16ZAfQj/
 oHkZEkDJJfU9l/wb6Yaex8lkTx5goyviDe/Q5nzUjxHqOpC5CS3GV0klG6NdfWP6XvASx1qRw1I
 7pX3uqinB80J2qHy0RxW0++7YiuKwnbF7Rm/rm6TCjuQIDhflhwmNHFwM2/+LsvtIb+p7wR7SaM
 Ne38Y5rhHEiESpw01Za57V4VaeDYjFAnl3PFQsVydos6hY9HkPaKxmv1r+HB7C68HEkBDUotCXp
 BxauGGCgLOAB8e2fOOdsRRbgRr3H7muFvWXX6mUMKeTOXe0Ng2bdAqMtj8ijmsm7xhdwADSHESb
 0hLc6fAUJ4OySgKlxzE0NyajfnXqB72uvuvZDarlo935WgZ9n0Dko9UvBwwkJhbcDiUnGxXYlD2
 rkJp4Ugv1naalDnywRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090073

On 26-10-07 23:37:16, Joonhoe Kim wrote:
> As on SM8650, SM8750 and Eliza, the UFS AXI PHY clock needs
> FORCE_MEM_CORE_ON for the UFS controller in MCQ mode. Without it the MCQ
> configuration is lost over system suspend, and with MCQ enabled every
> resume from s2idle ends in an SMMU fault and a host reset.
> 
> The UFS PHY ICE core clock already has the bit set; set it for the UFS
> PHY AXI clock as well.
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

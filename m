Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537909;
	b=hqKCOqDLB/c6L0QUmPTc7b3u64ruAeGDcXQIk7SNcSniDiJe9cVQnWkfAJDzh45zTeN0
	 iV5k4rl1aYm8Yfh5TwlPfFGegnJi05RCuWQgQg31dBkBuI6MptVM4Znsnza2gFsE9l7tp
	 h9Jhfd5bWRSkUSZSD05wDu+1kqO0f5oaNpQbHykLUrhsJ+ZY0FnxCpEMrIDxqlN11IA7Q
	 n/koowCOE3BGz14zZk5KMc1QGwvKmQ081Zq4c/LLyqhAlcnQKxLUKZDIK/9Tz3k/5SRr8
	 oOOE1RKf2MEbzKjuAQ6KWGl7ijL2d0TCk/n+ngF1yeBA4lNwYk2PDhUjZ4SaiEl70JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qtARsC4Auod18/0Cb93J6g5b7nimOjNLB7M6YwHe+gg=;
	b=XCHrubvENvVCHtXBVbBo+jTjDo9Guq4Hnvr6A61B7nyt6QOuXZX73TajJIJW5/udOoys
	 GCU2IfYiOws63I1Vy8001Tg1ssgdePOcBUBkbjTTN+CQBPmzp5LXuCRqzRiDdfvvogwop
	 8b5mlwf+iNbXZ+0U+CHlTdN/fY4SRB6wlCjVefNxSixCimGjlmVLgvC3CsRdUXIrk0igG
	 7CjgoRUb2QVDIKSer0KubBMwgcQQgaUsjOSWseBwLMl0f6LEal3L/MrHXDWt4hzU1lXaV
	 BedA35l23kkZuPSK274jInh8HgyuHKxoCFfThxv163qhfUEnvuz8hxlscDCyvIIANdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bxRpEk0D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+UjZSQ4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D6606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 23:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719D6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bxRpEk0D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+UjZSQ4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtrpT2222896
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 23:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtARsC4Auod18/0Cb93J6g5b7nimOjNLB7M6YwHe+gg=; b=bxRpEk0DXBU8fjQ/
	MkgQLbp4diXe5KClxhkcqBdDEs8cZr5HRvGA6oFAdgMIT1dqy4DRHo0TagbE0ft4
	b40/AWtQF4191cgMhCNIrEHzrvu4kp6ZB30bbf6Zxw6s3kKz2zh9sBYVto56S0Mh
	drEr9xMc6Ek6AMc07bpjh3AKSq27iZMuZr+aiG58zX6hXFiiojBankFs2SrK2iyb
	25NVW9y0pwreUy5/L7TKd5sAPE6VF3/BM3eAPycoolgD09WPxBFISv1UvYiXUSNH
	TofhQwRN7gVEkzl9Ij6TwyB0+A7720LtYdrkWxyBFzskF9eKfdYXJ4B7tmCMyLAo
	lTKEhw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0gyf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 23:11:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36696c9f55bso156630eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792537903; x=1793142703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtARsC4Auod18/0Cb93J6g5b7nimOjNLB7M6YwHe+gg=;
        b=W+UjZSQ430eerf5kQGdan+BWVxDHWsWWfX6w2EQHz4tLgvROc9T3I9CBbKKochQi21
         gfnFCZddCswl3yKKfmMRWnyhQg1ahHpSe20bqg+wdODsVT5v6Ql1xXzRHjATBcYJbHDY
         ZcI0t6eQ35wuhzlEWQB7enwnLBY2EFSmYiEP0YTSNcQ+ond1+Gn3DXmeB43nYmBPq+r/
         Cvkj0Ey+/9lfBacay1hpr4xvYf1jl4NvjBk7iCNzXFhmqK9uJ8xuBQogE8WUjmE9NuLF
         6y8yyxS7cTieBeAXoWjHrk9OtrRed9LFC6z/8R0DDF2E5iAePmlCnTAH5vCCRnyJ1KS0
         KPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537903; x=1793142703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtARsC4Auod18/0Cb93J6g5b7nimOjNLB7M6YwHe+gg=;
        b=woY5EkEx8tSQZnWNpGUXCByq+341bq9cZDM8ZG8dhWQGZ70Dh+0/iTdV3c7ekXC0Bv
         nuYrlqWpxkwnsW/9cAjuAZfiK/mb/vL8Ns07e6+3heBoF0ZbTCYaL/+FeYyyADOy9edI
         kWR8SOX9sTXWFg4YVrjH2BT8S9LGoY0K8yqZBVvtvL7X8AzXhhe2mJLdobvukbPaporM
         w9N2bGJTVL0xD6FSwQwfVIOWjjmjdRaCevhBN8mvOip4NRCBMwMh8P1sNbyKWBd2wp2a
         SA8dlKBaSx735bu+gTwOnt09xPkf983tuBmUcaLF2M89r+rtPIKeD8ElOo7mNyWANC1r
         cVUw==
X-Forwarded-Encrypted: i=1; AKwUvBz/wT/IRXxU6payxxwoSQMIaiLtBIMepH3Y83sUfGdMxQgW6eF2ooeMfCjh/X9ifuDeWDpv3l3FSLWPMDBw@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+0ZDR7N/pUuWzZjEwoaI1x0gB1VoZwXAQaFmNImA6ZMI9l6wt
	SJfe2+fkfgu5XB1pR4YLmO57jSrZskB7u8gyfp3iMjLCxLtOrd5l+xcvhWNeEIlV303ubsczyim
	EO+ZA48WC5rjXkxqquQkKpSqfaRP98YWUOw09ScqYtKDT755dQkPXcjmv6jq0JY561SYZ
X-Gm-Gg: AYBFou3/b9gsBb4h+M7Jkrv2KtwbAuCu8DtEewCSm3cPCnV/7zNk4+loT+7w/B15F7m
	nzbSjZ9siNuGySCRlXs3wbxswxuxdSSlfsx2/6/9k+vTR0o70rZf3OBc6lO2nqNm9ud3yx6sbV6
	Ql8Q70x2K1eHRItKn7UaxvM6ZxKhqMRhOgW6n/OPIN0AY0mxeXtYZgk4UNEiyxyt77EM4L3C5Ex
	QOx4mdKIYqFlYKuOMCzF0T/9ZXB5SUb6QLSPsKBG1Dcmw0cm4PpwAamU5M0ulZ92uUa0m5/kOcA
	vX8aW2yoduJkgK6ht1wEEYTVTGmhAfuZAmYg/qzKFcb+13RrgGk7GlcXlt9t8fOIHcEQ1PlzQmT
	nBbUbFyMQ+NA+eHMxOCBQq15r+c6wcvek95yUJKEeNyfhZmZhZ6f1JBiN
X-Received: by 2002:a05:7300:d58d:b0:351:606f:2832 with SMTP id 5a478bee46e88-3674c92db53mr831468eec.3.1792537902816;
        Tue, 20 Oct 2026 16:11:42 -0700 (PDT)
X-Received: by 2002:a05:7300:d58d:b0:351:606f:2832 with SMTP id 5a478bee46e88-3674c92db53mr831426eec.3.1792537902166;
        Tue, 20 Oct 2026 16:11:42 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm1704329eec.10.2026.10.20.16.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 16:11:41 -0700 (PDT)
Message-ID: <471fb0e6-1a86-4ee8-b86f-3e5bc88b1918@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:11:39 -0700
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
Subject: Re: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
To: George Neacsu <geocausa@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong
 <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
 <db2fffdd-634c-4728-a2a6-2ab1816b07ba@oss.qualcomm.com>
 <20261017070443.989736-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017070443.989736-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA5MiBTYWx0ZWRfX4fcVRfR5xIkF
 ljGd0gCVDk9Ig8jsMB5fyOPcq+Pe9r2zkTwPZLw6P8V0UZRSeEhEUVNAwO0unyJg6Bpqel0unXL
 fPOeqaJ/60yM/gxsENYUNMzf36z1Wl3aad7CYm/PR85os+GyIPPnY6lkgsm89roliXtQiDq5iRE
 U4dn74TyK487Bqyu6Uo2tALrZPeN6RM3XdnJBkNNuxHoZyV27DpsRUrj7hNyOOgLu+1s/vUqjbC
 Zd5QH8kV4g2ME+No0H7bFVd2owUyz0bkspUR8aUcatlCE8QYYCO7IDxLKxb5SsiHusEpI1CQjbB
 N+vNNrRxkQA1LAoPE99COWOSNBbG/Wm5QfIeQtwIrpyMH5u/ZinpY/lfuTNISlEXLWDO2o89ZNO
 Nlj9bJgxCKTXKiJRRw2Cy1wd054mBBg2fBgta9EPnCeTnIFvujPzwe+q83ROIQZ/+RN3E0ENloy
 ZJrwhmBx6QkK1l8PlYw==
X-Proofpoint-ORIG-GUID: LeOAiDvbMmas5Q99qkuY_vwqRD2pKqei
X-Proofpoint-GUID: LeOAiDvbMmas5Q99qkuY_vwqRD2pKqei
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA5MiBTYWx0ZWRfXzUwfIyXRfXZS
 zedYraW4c/sQG7/SIusBFPgHu+m6YxnqE7qEWihYJglFfOaWRXY0mD2Vlwap1rV33vb/GS5IIYy
 4m3lBks8xDRa6hbUXuKeeXJw1oLgoYA=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad7f52f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Yf9p7-GFqWoa8jJlbhQA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200092

Hi George,

Sounds good. I will release the next version of patchset which will
include the best versions of Nihal's series and mine after careful
selection.

On 10/17/2026 12:04 AM, George Neacsu wrote:
> Hi Anusha,
> 
> On 17/10/2026 05:31, Anusha Arun Nandi wrote:
>> In our series we split C-PHY hw-ops into a dedicated
>> phy-qcom-mipi-csi2-3ph-cphy.c (mirroring the existing -3ph-dphy.c
>> split)
> 
> Thanks, I had missed your July series. Your three series cover what
> this one does and more: the generic C-PHY API in its own
> phy-core-mipi-cphy.c like the D-PHY one, the C-PHY ops in their own
> file, two SoCs, and the CAMSS side including David's patches. The split
> makes sense to me, and two versions of PHY_MODE_MIPI_CPHY should not
> both go in.
> 
> So I would rather build on yours than send a v4 of this series. I will
> send the X1E80100 sequence as one patch adding it to
> phy-qcom-mipi-csi2-3ph-cphy.c on top of your series, and test the whole
> stack on the Surface Pro 11 (IMX681 on CSIPHY2, one trio at
> 2.4 Gsym/s), with Tested-by on your patches if it works.
> 
> Review of this series raised a few points that I will check against
> your patches and comment on there:
> - the settle count computed from the timer clock rate instead of a
>   fixed table value (Nihal);
> - a u64 symbol rate, so 32-bit can hold rates above 4.29 Gsym/s;
> - trios instead of lanes in the C-PHY options (Loic).
> 
> Also, Vinod and linux-phy are not on Cc for your PHY series.
> 
Thank you for the heads-up!> Bryan, Vinod: unless you would rather take
this series, I will follow
> Anusha's.
> 
> Thanks,
> George

Best Regards,
Anusha

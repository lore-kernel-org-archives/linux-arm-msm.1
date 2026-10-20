Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.235.229.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506454;
	b=IRMMbOqPYdYuOZ9rqv/tFpKa+HowaAl4G4PpqyQhGS8DaZkKk0eDfg5kEeZgn4pv99FH
	 rQirBvEklOLHV6BLzZNSt4g3w4dz7nDZ115B9/ZjlIkf/L6diN9DyC+/gk932mpZtmmrD
	 X6evpD3Lapy2J0p01qflgzav2ucfzngzwIQKQsDvHSb+CTCiXEwlXDLd3+40I5iJ7BsNW
	 CdYTU2UOIVw/v0v0xb5TWdQLFLG2q9LsBJNlvw3KkaFng8GvPnGF2qinr51kWSF8J5KpN
	 tCsv61hHKr54qiEAnuuzryP6xmpjt+4nwKJjh03HKu4rLaUksBy7cbc5EveCGd/QuvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506454;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:X-Chocolate:
	 X-Operating-System:X-Uptime:User-Agent;
	bh=FDLsMiFxoa207fgd2lstXLYT1Z99qsdirxj6+VkwRPQ=;
	b=BkMVpLmGwhcTpwMFVMGu/HpU6doJwJMXrLkgqYENQQVSU6vrFpDAeGtYmO9lmrNWDQhc
	 6i/TWsMqPSVTxVeQSU/Pm0ZdJyjGGBqzg9e0HKK51oPyaEeytaRT85k7eL2DyT80v8r7B
	 EQIez/L67LsD4lWfQ16f5xBI4uTPlEvwO5waglxGg1mKfJ1OqE1cFerLP8Jgkyy+XrC68
	 phboQ/xe1b9kHZVsmXCo9/IQqYmEGRSIVUSWeg52t0abBLQJWwYjoRRs3Udi5A0wf7T86
	 Df7PwbzF5kNwvwi46fONOv9qIGBMw+Jz1SPEF/EJm6s1yPvD53EaTPS5DXiCumEkL8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=treblig.org;
	spf=pass smtp.mailfrom=treblig.org;
	dkim=pass header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=VA4disuJ;
	arc=none smtp.remote-ip=46.235.229.95
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A70606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 14:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A70606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=VA4disuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=FDLsMiFxoa207fgd2lstXLYT1Z99qsdirxj6+VkwRPQ=; b=VA4disuJDbzyg2Sl
	1YtH4mNyM/v5ojItu+Pt311M4zS/uXF5z7JJBVYukP0QZTi/MJeIYyK94eYoFcGgiLgJwa/qt2FxD
	PLPsj3yEfSFZuUyY5YUhPXFO2THt4vgsiZi3UACk6CMGbYXttwvbL0FNmlLmUnP8odlbaaBxTv/+8
	Aw6VE6XKrpjisPfVETn3bqUX3L0BeD4o60hNbcM/Qz09OQE1CuC9ltsnHg0Ic00oLakxsS+Ivcm5b
	arDrI052AJOogIcXdRPNod5Dc+d7KQ4j2E1QID2xig/iX3pEirwFjcT8hXU6+8vDPwFmh7t0ea1iM
	D7PXxvUXS1g26BXbfA==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1xJAoH-0000000181u-3h0H;
	Tue, 20 Oct 2026 14:27:25 +0000
Date: Tue, 20 Oct 2026 14:27:25 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: krzk@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org
Subject: Tips on tracing bwmon?
Message-ID: <atd6TRv4HQApcPvY@gallifrey>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.113+deb13-amd64 (x86_64)
X-Uptime: 14:08:46 up 3 days, 23:29,  2 users,  load average: 0.08, 0.08, 0.03
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi all,
  I was looking for some tips on if I can use bwmon to see what interconnect
bandwidth is going through the dwc3 usb controllers on my x1 based Asus Zenbook A14.

  I've got usb-ncm gadget wired between a pair of them and I'd
like to see what stats are available;
(See details of my gadget stuff setup in
 https://lore.kernel.org/linux-arm-msm/atJn2jfI_cZy3UMo@gallifrey/T/#u )
And that's struggling to get much over 4Gbit/s over the network interface.

One reason I'm curious is because the dwc3-qcom glue sets an average
and a peak icc limit, and I wanted to know what the difference was and
what the type of timescales were for how long it allowed a peak.

Are there any docs I should look at?

I did:
   trace-cmd stream -e icc_bwmon:qcom_bwmon_update > log
on both machines and during the run I'm seeing events on exactly 3 of the
monitors;
24091000.pmu, 240b5400.pmu, 240b6400.pmu

(In the numbers below I've grepped for that monitor and sed'ed out
upto the 'measu_kbps=' part so I can then sort on the meas_kbps)

My reading of the interconnects_summary is these PMUs are
somewhere under the llcc_mc@interconnect-1, and in some
cases under both chm_apps@  and qns_llcc

So how do I interpret these - can I infer the bandwidth the usb controller
is using or just have a feel for the level above?
(Here the iperf -s server is running on 'dragon' and the client is
running on 'soup' - I find the partial symmetry between 240b[56]400.pmu
on the two machines promising it's measuring something useful!)

This is running a 7.30-rc6 with a bunch of stuff from Jens Glathe
on top.

Thanks in advance,

Dave (numbers below)

24091000.pmu
  on the llcc_mc@interconnect-1 (which also has the a400000.usb)
  
   dragon/server:
        lowest:    16000 up_kbps=800001 down_kbps=800000
       heighest: 2816000 up_kbps=3072001 down_kbps=2188000
        h-l:     2800000         2272000           1388000

   soup/client:
         lowest: 160000 up_kbps=800001 down_kbps=800000
        highest: 6256000 up_kbps=6835201 down_kbps=6220800               
        h-l      6096000         6035200           5420800


240b5400.pmu
  on the chm_apps@26400000.interconnect (which also has the a400000.usb)
        also under qns_llcc@26400000.interconnect
  
    dragon/server:
         lowest: 1328000 up_kbps=4800001 down_kbps=4800000
       heighest: 5616000 up_kbps=7464001 down_kbps=4800000 
            h-l  4288000         2664000                 0

    soup/client:
         lowest: 1440000 up_kbps=4800001 down_kbps=4800000
        highest: 4480000 up_kbps=4800001 down_kbps=4800000
            h-l  3040000               0                 0
                                                          
240b6400.pmu
  same as for 240b5400
  
    dragon/server:
         lowest:  352000 up_kbps=4800001 down_kbps=4800000
        highest: 3568000 up_kbps=4800001 down_kbps=4800000
            h-l  3216000               0                 0

    soup/client:
         lowest: 3216000 up_kbps=4800001 down_kbps=4800000
       heighest: 8736000 up_kbps=9600001 down_kbps=7464000
           h-l   5520000         4800000           2664000

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
